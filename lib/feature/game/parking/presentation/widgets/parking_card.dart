import 'package:com_russia_game_flutter_ui/core/shared_widgets/custom_animated_click.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParkingCard extends StatelessWidget {
  final Widget? child;
  final String? iconPath;
  final String? backgroundSvgPath;
  final double? width;
  final double? height;
  final double? cornerRadius;
  final double? cornerSmoothing;
  final double? borderWidth;
  final List<Color>? borderGradientColors;
  final List<Color>? fillGradientColors;
  final EdgeInsetsGeometry? padding;
  final BoxFit? backgroundFit;

  const ParkingCard({
    super.key,
    this.child,
    this.iconPath,
    this.backgroundSvgPath,
    this.width,
    this.height,
    this.cornerRadius,
    this.cornerSmoothing,
    this.borderWidth,
    this.borderGradientColors,
    this.fillGradientColors,
    this.padding,
    this.backgroundFit,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveWidth = width ?? 100;
    final double effectiveHeight = height ?? 100;
    final double radius = cornerRadius ?? 30.0;
    final double smoothing = cornerSmoothing ?? 1.0;
    final double effectiveBorderWidth = borderWidth ?? 1.0;

    final List<Color> borderColors =
        borderGradientColors ??
        [
          AppColors.white.withOpacity(.5),
          AppColors.white.withOpacity(.0),
          AppColors.white.withOpacity(.3),
        ];

    final List<Color> fillColors =
        fillGradientColors ?? [Color(0xFF404040), Color(0xFF303030), Color(0xFF404040)];

    return TapAnimation(
      child: Container(
        width: effectiveWidth,
        height: effectiveHeight,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(cornerRadius: radius, cornerSmoothing: smoothing),
          ),
          gradient: RadialGradient(radius: 2.0, colors: borderColors, stops: [0.0, 0.55, 1.0]),
        ),
        child: Container(
          margin: EdgeInsets.all(effectiveBorderWidth),
          child: ClipSmoothRect(
            radius: SmoothBorderRadius(
              cornerRadius: radius - effectiveBorderWidth,
              cornerSmoothing: smoothing,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: radius - effectiveBorderWidth,
                    cornerSmoothing: smoothing,
                  ),
                ),
                gradient: RadialGradient(stops: [0.0, 0.55, 2.0], radius: 2.0, colors: fillColors),
              ),
              child: Stack(
                children: [
                  if (backgroundSvgPath != null)
                    Positioned.fill(
                      child: SvgPicture.asset(
                        backgroundSvgPath!,
                        fit: backgroundFit ?? BoxFit.cover,
                      ),
                    ),
                  Container(padding: padding ?? EdgeInsets.all(8.0), child: child),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
