import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_images.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

class BalanceWidget extends StatelessWidget {
  final Widget? child;
  final String? coinIconPath;
  final double? height;
  final double? cornerRadius;

  // cглаживание скруглений (0.0–1.0)
  final double? cornerSmoothing;
  final double? borderWidth;
  final double? innerBlurRadius;
  final double? outerBlurRadius;
  final double? iconSize;
  final double? addIconPaddingLeft;
  final double? addIconPaddingRight;
  final EdgeInsets? iconPadding;
  final EdgeInsets? containerMargin;
  final List<Color>? borderGradientColors;
  final List<Color>? fillGradientColors;

  const BalanceWidget({
    super.key,
    this.child,
    this.coinIconPath,
    this.height,
    this.cornerRadius,
    this.cornerSmoothing,
    this.borderWidth,
    this.iconSize,
    this.iconPadding,
    this.containerMargin,
    this.borderGradientColors,
    this.fillGradientColors,
    this.addIconPaddingLeft,
    this.addIconPaddingRight,
    this.innerBlurRadius,
    this.outerBlurRadius,
  });

  @override
  Widget build(BuildContext context) {
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
        fillGradientColors ??
        const [
          Color.fromARGB(255, 55, 29, 24),
          AppColors.refYellowLight1,
          AppColors.refYellowDark2,
        ];

    return Container(
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

          shadows: [
            BoxShadow(
              color: Color.fromARGB(255, 112, 84, 45).withOpacity(.6),
              blurRadius: outerBlurRadius ?? sdpW(context, 60),
              spreadRadius: 0,
              offset: Offset(sdpW(context, -20), sdpW(context, 0)),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: fillColors,
          ),
        ),
        padding: effectivePadding,
        child: Row(
          children: [
            InnerShadow(
              shadows: [
                Shadow(
                  color: AppColors.black.withOpacity(0.5),
                  blurRadius: innerBlurRadius ?? sdpW(context, 50),
                ),
              ],
              child: Container(
                height: double.maxFinite,
                margin: containerMargin,
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius.only(
                      topLeft: SmoothRadius(cornerRadius: radius * 0.9, cornerSmoothing: smoothing),
                      bottomLeft: SmoothRadius(
                        cornerRadius: radius * 0.9,
                        cornerSmoothing: smoothing,
                      ),
                      topRight: SmoothRadius.zero,
                      bottomRight: SmoothRadius.zero,
                    ),
                  ),
                  color: Color(0xFF2C1D0C),
                ),
                padding: EdgeInsets.symmetric(horizontal: sdpW(context, 42)),
                child: Row(
                  children: [
                    Image.asset(coinIconPath ?? AppImages.refCoins, width: effectiveIconSize),

                    sdpW(context, 14).width,

                    Text(
                      textAlign: TextAlign.center,
                      990.toString(),
                      style: AppFonts.fontHalvar34sdp(context, AppColors.white, FontWeight.w700),
                    ),

                    sdpW(context, 16).width,

                    Text(
                      textAlign: TextAlign.center,
                      context.locales.RC,
                      style: AppFonts.fontHalvar34sdp(
                        context,
                        AppColors.refYellowLight,
                        FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            child ??
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: addIconPaddingLeft ?? sdpW(context, 37),
                      right: addIconPaddingRight ?? sdpW(context, 37 + 3),
                    ),
                    child: Image.asset(AppImages.refAdd, width: effectiveIconSize * 0.666),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
