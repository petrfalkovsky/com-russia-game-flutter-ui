import 'package:com_russia_game_flutter_ui/core/shared_widgets/custom_animated_click.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class CloseWidget extends StatelessWidget {
  final Widget? child;
  final String? iconPath;
  final double? width;
  final double? height;
  final double? cornerRadius;
  final double? cornerSmoothing;
  final double? borderWidth;
  final double? iconSize;
  final EdgeInsets? iconPadding;
  final List<Color>? borderGradientColors;
  final List<Color>? fillGradientColors;
  final Color? iconColor;

  final VoidCallback? onTap;

  const CloseWidget({
    super.key,
    this.child,
    this.iconPath,
    this.width,
    this.height,
    this.cornerRadius,
    this.cornerSmoothing,
    this.borderWidth,
    this.iconSize,
    this.iconPadding,
    this.borderGradientColors,
    this.fillGradientColors,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveWidth = width ?? 100;
    final double effectiveHeight = height ?? 100;
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
      onTap: onTap,
      child: Container(
        width: effectiveWidth,
        height: effectiveHeight,
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
                  iconPath ?? AppWepb.refClose,
                  width: effectiveIconSize,
                  color: iconColor ?? AppColors.white.withOpacity(.7),
                ),
              ),
        ),
      ),
    );
  }
}
