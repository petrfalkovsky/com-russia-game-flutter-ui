import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/adaptive_widget.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquirqleGradientBorder extends AdaptiveWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double cornerRadius;
  final double cornerSmoothing;
  final List<Color>? borderGradientColors;
  final List<double>? borderGradientStops;
  final double borderGradientRadius;
  final bool isLinearBorderGradient;
  final AlignmentGeometry? borderGradientBegin;
  final AlignmentGeometry? borderGradientEnd;
  final EdgeInsets? padding;

  // заливка контейнера
  final List<Color>? fillGradientColors;
  final List<double>? fillGradientStops;
  final AlignmentGeometry? fillGradientBegin;
  final AlignmentGeometry? fillGradientEnd;
  final double? fillGradientRadius;

  // параметры для двух встроенных фонов
  final BackgroundConfig? background1;
  final BackgroundConfig? background2;

  // фон 0
  final String? imagePath0;
  final bool isSvg0;
  final BoxFit boxFit0;

  // фон 1 (поверх фона)
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
    this.isLinearBorderGradient = false,
    this.borderGradientBegin,
    this.borderGradientEnd,
    this.fillGradientColors,
    this.fillGradientStops,
    this.fillGradientBegin,
    this.fillGradientEnd,
    this.fillGradientRadius,
    this.background1,
    this.background2,
    this.imagePath0,
    this.isSvg0 = true,
    this.boxFit0 = BoxFit.cover,
    this.imagePath1,
    this.isSvg1 = true,
    this.boxFit01 = BoxFit.cover,
    this.child,
    this.padding,
  });

  @override
  Widget buildAdaptive(BuildContext context) {
    final List<Color> borderColors =
        borderGradientColors ?? [Colors.white.withOpacity(.6), Colors.white.withOpacity(.0)];

    final List<double> borderStops = borderGradientStops ?? [0.0, 1.0];

    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // заливка контейнера
            if (fillGradientColors != null)
              Positioned.fill(
                child: ClipPath(
                  clipper: SquircleClipper(
                    cornerRadius: cornerRadius - borderWidth,
                    cornerSmoothing: cornerSmoothing,
                    borderWidth: borderWidth,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: fillGradientRadius != null
                          ? RadialGradient(
                              radius: fillGradientRadius!,
                              colors: fillGradientColors!,
                              stops: fillGradientStops,
                            )
                          : LinearGradient(
                              begin: fillGradientBegin ?? Alignment.topCenter,
                              end: fillGradientEnd ?? Alignment.bottomCenter,
                              colors: fillGradientColors!,
                              stops: fillGradientStops,
                            ),
                    ),
                  ),
                ),
              ),

            // фон 1 (нижний слой)
            if (background1 != null) _buildBackgroundLayer(background1!),

            // фон 2 (верхний слой)
            if (background2 != null) _buildBackgroundLayer(background2!),

            // фон-изображение 0
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

            // фон-изоражение 1 (поверх фона)
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

            // градиентная рамка
            CustomPaint(
              size: Size(width, height),
              painter: SmoothHolePainter(
                borderWidth: borderWidth,
                cornerRadius: cornerRadius,
                cornerSmoothing: cornerSmoothing,
                borderGradientColors: borderColors,
                borderGradientStops: borderStops,
                borderGradientRadius: borderGradientRadius,
                isLinearBorderGradient: isLinearBorderGradient,
                borderGradientBegin: borderGradientBegin,
                borderGradientEnd: borderGradientEnd,
              ),
            ),

            // любой ребенок поверх всего
            if (child != null)
              Positioned.fill(
                child: Padding(padding: padding ?? EdgeInsets.all(borderWidth), child: child),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage({required String path, required bool isSvg, required BoxFit fit}) {
    if (isSvg) {
      return SvgPicture.asset(path, fit: fit);
    } else {
      return Image.asset(path, fit: fit);
    }
  }

  Widget _buildBackgroundLayer(BackgroundConfig config) {
    return Positioned.fill(
      child: ClipPath(
        clipper: SquircleClipper(
          cornerRadius: cornerRadius - borderWidth,
          cornerSmoothing: cornerSmoothing,
          borderWidth: borderWidth,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: config.isRadial
                ? RadialGradient(
                    center: config.gradientCenter ?? Alignment.center,
                    radius: config.gradientRadius ?? 1.0,
                    colors: config.colors,
                    stops: config.stops,
                  )
                : LinearGradient(
                    begin: config.gradientBegin ?? Alignment.topCenter,
                    end: config.gradientEnd ?? Alignment.bottomCenter,
                    colors: config.colors,
                    stops: config.stops,
                  ),
          ),
        ),
      ),
    );
  }
}

class BackgroundConfig {
  final List<Color> colors;
  final List<double>? stops;
  final bool isRadial;
  final AlignmentGeometry? gradientBegin;
  final AlignmentGeometry? gradientEnd;
  final AlignmentGeometry? gradientCenter;
  final double? gradientRadius;

  const BackgroundConfig({
    required this.colors,
    this.stops,
    this.isRadial = false,
    this.gradientBegin,
    this.gradientEnd,
    this.gradientCenter,
    this.gradientRadius,
  });
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
  final bool isLinearBorderGradient;
  final AlignmentGeometry? borderGradientBegin;
  final AlignmentGeometry? borderGradientEnd;

  SmoothHolePainter({
    required this.borderWidth,
    required this.cornerRadius,
    required this.cornerSmoothing,
    required this.borderGradientColors,
    required this.borderGradientStops,
    required this.borderGradientRadius,
    this.isLinearBorderGradient = false,
    this.borderGradientBegin,
    this.borderGradientEnd,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = isLinearBorderGradient
          ? LinearGradient(
              begin: borderGradientBegin ?? Alignment.topCenter,
              end: borderGradientEnd ?? Alignment.bottomCenter,
              colors: borderGradientColors,
              stops: borderGradientStops,
            ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          : RadialGradient(
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
