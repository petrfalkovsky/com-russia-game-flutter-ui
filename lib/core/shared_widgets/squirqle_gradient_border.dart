import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquirqleGradientBorder extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double cornerRadius;
  final double cornerSmoothing;
  final List<Color>? borderGradientColors;
  final List<double>? borderGradientStops;
  final double borderGradientRadius;

  // Первое изображение (фон)
  final String? imagePath0;
  final bool isSvg0;
  final BoxFit boxFit0;

  // Второе изображение (поверх фона)
  final String? imagePath1;
  final bool isSvg1;
  final BoxFit boxFit01;

  final Widget? child;

  const SquirqleGradientBorder({
    super.key,
    this.width = 200,
    this.height = 200,
    this.borderWidth = 10,
    this.cornerRadius = 30,
    this.cornerSmoothing = 1.0,
    this.borderGradientColors,
    this.borderGradientStops,
    this.borderGradientRadius = 1.09,
    this.imagePath0,
    this.isSvg0 = true,
    this.boxFit0 = BoxFit.cover,
    this.imagePath1,
    this.isSvg1 = true,
    this.boxFit01 = BoxFit.cover,
    this.child,
  });

  Widget _buildImage({required String path, required bool isSvg, required BoxFit fit}) {
    if (isSvg) {
      return SvgPicture.asset(path, fit: fit);
    } else {
      return Image.asset(path, fit: fit);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> colors =
        borderGradientColors ?? [Colors.white.withOpacity(.6), Colors.white.withOpacity(.0)];

    final List<double> stops = borderGradientStops ?? [0.0, 1.0];

    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Первое изображение (фон)
            if (imagePath0 != null)
              Positioned.fill(
                child: ClipPath(
                  clipper: SquircleClipper(
                    cornerRadius: cornerRadius - borderWidth,
                    cornerSmoothing: cornerSmoothing,
                    borderWidth: borderWidth,
                  ),
                  child: _buildImage(path: imagePath0!, isSvg: isSvg0, fit: boxFit0),
                ),
              ),

            // Второе изображение (поверх фона)
            if (imagePath1 != null)
              Positioned.fill(
                child: ClipPath(
                  clipper: SquircleClipper(
                    cornerRadius: cornerRadius - borderWidth,
                    cornerSmoothing: cornerSmoothing,
                    borderWidth: borderWidth,
                  ),
                  child: _buildImage(path: imagePath1!, isSvg: isSvg1, fit: boxFit01),
                ),
              ),

            // Градиентная рамка
            CustomPaint(
              size: Size(width, height),
              painter: SmoothHolePainter(
                borderWidth: borderWidth,
                cornerRadius: cornerRadius,
                cornerSmoothing: cornerSmoothing,
                borderGradientColors: colors,
                borderGradientStops: stops,
                borderGradientRadius: borderGradientRadius,
              ),
            ),

            // Контент поверх всего
            if (child != null)
              Positioned.fill(
                child: Padding(padding: EdgeInsets.all(borderWidth), child: child),
              ),
          ],
        ),
      ),
    );
  }
}

class SquircleClipper extends CustomClipper<Path> {
  final double cornerRadius;
  final double cornerSmoothing;
  final double borderWidth;

  SquircleClipper({
    required this.cornerRadius,
    required this.cornerSmoothing,
    required this.borderWidth,
  });

  @override
  Path getClip(Size size) {
    final innerRadius = cornerRadius - borderWidth;
    return SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(
        cornerRadius: innerRadius > 0 ? innerRadius : 0,
        cornerSmoothing: cornerSmoothing,
      ),
    ).getOuterPath(
      Rect.fromLTWH(
        borderWidth,
        borderWidth,
        size.width - borderWidth * 2,
        size.height - borderWidth * 2,
      ),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class SmoothHolePainter extends CustomPainter {
  final double borderWidth;
  final double cornerRadius;
  final double cornerSmoothing;
  final List<Color> borderGradientColors;
  final List<double> borderGradientStops;
  final double borderGradientRadius;

  SmoothHolePainter({
    required this.borderWidth,
    required this.cornerRadius,
    required this.cornerSmoothing,
    required this.borderGradientColors,
    required this.borderGradientStops,
    required this.borderGradientRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        radius: borderGradientRadius,
        colors: borderGradientColors,
        stops: borderGradientStops,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final outerPath = SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(
        cornerRadius: cornerRadius,
        cornerSmoothing: cornerSmoothing,
      ),
    ).getOuterPath(Rect.fromLTWH(0, 0, size.width, size.height));

    final innerRadius = cornerRadius - borderWidth;
    final innerPath =
        SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: innerRadius > 0 ? innerRadius : 0,
            cornerSmoothing: cornerSmoothing,
          ),
        ).getOuterPath(
          Rect.fromLTWH(
            borderWidth,
            borderWidth,
            size.width - borderWidth * 2,
            size.height - borderWidth * 2,
          ),
        );

    final holePath = Path.combine(PathOperation.difference, outerPath, innerPath);

    canvas.drawPath(holePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
