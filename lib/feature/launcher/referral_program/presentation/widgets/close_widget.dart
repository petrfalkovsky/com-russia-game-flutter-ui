import 'package:com_russia_game_flutter_ui/core/shared_widgets/custom_animated_click.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_images.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class CloseWidget extends StatelessWidget {
  final Widget? child;
  final String? iconPath;
  final double? size;
  final double? cornerRadius;

  // cглаживание скруглений (0.0–1.0)
  final double? cornerSmoothing;
  final double? borderWidth;
  final double? iconSize;
  final EdgeInsets? iconPadding;
  final List<Color>? borderGradientColors;
  final List<Color>? fillGradientColors;

  const CloseWidget({
    super.key,
    this.child,
    this.iconPath,
    this.size,
    this.cornerRadius,
    this.cornerSmoothing,
    this.borderWidth,
    this.iconSize,
    this.iconPadding,
    this.borderGradientColors,
    this.fillGradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveSize = size ?? 100;
    final double radius = cornerRadius ?? 30.0;
    final double smoothing = cornerSmoothing ?? 1.0;
    final double effectiveBorderWidth = borderWidth ?? 1.0;
    final double effectiveIconSize = iconSize ?? 40.0;
    final EdgeInsets effectivePadding = iconPadding ?? EdgeInsets.zero;

    final List<Color> borderColors =
        borderGradientColors ??
        [
          AppColors.white.withOpacity(.3),
          AppColors.white.withOpacity(.0),
          AppColors.white.withOpacity(.3),
        ];

    final List<Color> fillColors =
        fillGradientColors ?? const [Color(0xFF282828), Color(0xFF1F1F1F)];

    return TapAnimation(
      child: Container(
        width: effectiveSize,
        height: effectiveSize,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(cornerRadius: radius, cornerSmoothing: smoothing),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: borderColors,
            stops: [0.0, 0.55, 1.0],
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(effectiveBorderWidth),
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: radius - effectiveBorderWidth,
                cornerSmoothing: smoothing,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: fillColors,
            ),
          ),
          padding: effectivePadding,
          child:
              child ??
              Center(
                child: Image.asset(
                  iconPath ?? AppImages.refClose,
                  width: effectiveIconSize,
                  color: AppColors.white.withOpacity(.7),
                ),
              ),
        ),
      ),
    );
  }
}
