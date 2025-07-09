import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_sdp_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class PromocodeWidget extends StatelessWidget {
  final Widget? child;
  final String? coinIconPath;
  final String? textValue;
  final double? height;
  final double? secondIconSize;
  final double? copyIconSize;
  final double? cornerRadius;

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

  final VoidCallback onTapCopy;
  final VoidCallback onTapEdit;

  const PromocodeWidget({
    super.key,
    this.child,
    this.coinIconPath,
    this.textValue,
    this.height,
    this.secondIconSize,
    this.cornerRadius,
    this.cornerSmoothing,
    this.borderWidth,
    this.iconSize,
    this.copyIconSize,
    this.iconPadding,
    this.containerMargin,
    this.borderGradientColors,
    this.fillGradientColors,
    this.addIconPaddingLeft,
    this.addIconPaddingRight,
    this.innerBlurRadius,
    this.outerBlurRadius,
    required this.onTapCopy,
    required this.onTapEdit,
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

    return Container(
      height: effectiveHeight,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(cornerRadius: radius * 0.96, cornerSmoothing: smoothing),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: borderColors,
          stops: [0.05, 0.6, 1.0],
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
          color: AppColors.refGrey,
        ),
        padding: effectivePadding,
        child: Row(
          children: [
            GestureDetector(
              onTap: onTapCopy,
              child: Container(
                height: double.maxFinite,
                margin: containerMargin,
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius.only(
                      topLeft: SmoothRadius(cornerRadius: radius, cornerSmoothing: smoothing),
                      bottomLeft: SmoothRadius(cornerRadius: radius, cornerSmoothing: smoothing),
                      topRight: SmoothRadius.zero,
                      bottomRight: SmoothRadius.zero,
                    ),
                  ),
                  color: AppColors.refGrey2.withOpacity(.8),
                ),
                padding: EdgeInsets.symmetric(horizontal: sdpW(context, 42)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(coinIconPath ?? AppWepb.refLink, width: effectiveIconSize),

                    sdpW(context, 30).width,

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              context.locales.ref_your_turn,
                              style: AppSdpFonts.fontAkrobat30sdpW(
                                context,
                                AppColors.white.withOpacity(.5),
                                FontWeight.w400,
                              ),
                            ),
                          ],
                        ),

                        sdpW(context, 20).height,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              textValue.toString(),
                              style: AppSdpFonts.fontAkrobat50sdpW(
                                context,
                                AppColors.white,
                                FontWeight.w500,
                              ),
                            ),
                            sdpW(context, 92).width,

                            Image.asset(AppWepb.refCopy, width: copyIconSize),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: onTapEdit,
              child:
                  child ??
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: addIconPaddingLeft ?? sdpW(context, 48),
                        right: addIconPaddingRight ?? sdpW(context, 48),
                      ),
                      child: Image.asset(AppWepb.refEdit, width: secondIconSize),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
