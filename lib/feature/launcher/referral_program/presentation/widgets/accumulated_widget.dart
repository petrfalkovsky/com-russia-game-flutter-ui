import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/custom_animated_click.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_sdp_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class AccumulatedWidget extends StatelessWidget {
  final Widget? rightChild;
  final String? leadIconPath;
  final String? textValue;
  final double? height;
  final double? secondIconSize;
  final double? copyIconSize;
  final double? cornerRadius;
  final double? cornerSmoothing;
  final double? borderWidth;
  final double? leadIconSize;
  final double? addIconPaddingLeft;
  final double? addIconPaddingRight;
  final EdgeInsets? iconPadding;
  final EdgeInsets? containerMargin;

  final int leftFlex;
  final List<Color>? leftBorderGradientColors;
  final List<Color>? leftFillGradientColors;
  final Color? leftFillColor;

  final int rightFlex;
  final List<Color>? rightBorderGradientColors;
  final List<Color> rightFillGradientColors;
  final Color? rightFillColor;
  final VoidCallback onTap;
  final bool isAccumulated;
  final bool isActiveButton;

  const AccumulatedWidget({
    super.key,
    this.rightChild,
    this.leadIconPath,
    this.textValue,
    this.height,
    this.secondIconSize,
    this.cornerRadius,
    this.cornerSmoothing,
    this.borderWidth,
    this.leadIconSize,
    this.copyIconSize,
    this.iconPadding,
    this.containerMargin,
    this.leftFlex = 3,
    this.rightFlex = 1,
    this.leftBorderGradientColors,
    this.leftFillGradientColors,
    this.leftFillColor,
    this.rightBorderGradientColors,
    required this.rightFillGradientColors,
    this.rightFillColor,
    this.addIconPaddingLeft,
    this.addIconPaddingRight,
    required this.onTap,
    this.isAccumulated = false,
    this.isActiveButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveHeight = height ?? 100;
    final double radius = cornerRadius ?? 30.0;
    final double smoothing = cornerSmoothing ?? 1.0;
    final double effectiveBorderWidth = borderWidth ?? 1.0;
    final double effectiveIconSize = leadIconSize ?? 40.0;

    return SizedBox(
      height: effectiveHeight,
      child: Row(
        children: [
          // Левый контейнер
          Expanded(
            flex: leftFlex,
            child: _buildLeftContainer(
              context,
              effectiveHeight,
              radius,
              smoothing,
              effectiveBorderWidth,
              effectiveIconSize,
            ),
          ),

          Expanded(
            flex: rightFlex,
            child: _buildRightContainer(
              context,
              effectiveHeight,
              radius,
              smoothing,
              effectiveBorderWidth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftContainer(
    BuildContext context,
    double effectiveHeight,
    double radius,
    double smoothing,
    double effectiveBorderWidth,
    double effectiveIconSize,
  ) {
    final List<Color> defaultLeftBorderColors =
        leftBorderGradientColors ??
        [
          AppColors.white.withOpacity(.3),
          AppColors.white.withOpacity(.0),
          AppColors.white.withOpacity(.3),
        ];

    return Container(
      height: effectiveHeight,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.only(
            topLeft: SmoothRadius(cornerRadius: radius * 0.96, cornerSmoothing: smoothing),
            bottomLeft: SmoothRadius(cornerRadius: radius * 0.96, cornerSmoothing: smoothing),
            topRight: SmoothRadius.zero,
            bottomRight: SmoothRadius.zero,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: defaultLeftBorderColors,
          stops: [0.0, 0.05, 0.1, 0.9],
        ),
      ),
      child: Stack(
        children: [
          /// фон самый нижний
          Container(
            margin: EdgeInsets.only(
              left: effectiveBorderWidth,
              top: effectiveBorderWidth,
              bottom: effectiveBorderWidth,
            ),
            decoration: ShapeDecoration(
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.only(
                  topLeft: SmoothRadius(
                    cornerRadius: radius - effectiveBorderWidth,
                    cornerSmoothing: smoothing,
                  ),
                  bottomLeft: SmoothRadius(
                    cornerRadius: radius - effectiveBorderWidth,
                    cornerSmoothing: smoothing,
                  ),
                  topRight: SmoothRadius.zero,
                  bottomRight: SmoothRadius.zero,
                ),
              ),
              gradient: leftFillGradientColors != null
                  ? LinearGradient(colors: leftFillGradientColors!)
                  : null,
              color:
                  leftFillColor ??
                  (leftFillGradientColors == null
                      ? (isAccumulated
                            ? AppColors.refGreenDark2
                            : AppColors.refGrey2.withOpacity(.8))
                      : null),
            ),
            padding: EdgeInsets.symmetric(horizontal: sdpW(context, 42)),
            child: Row(
              children: [
                Image.asset(leadIconPath ?? AppWepb.refLink, width: effectiveIconSize),
    
                sdpW(context, 30).width,
    
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.locales.ref_accumulated,
                        style: AppSdpFonts.fontAkrobat30sdpW(
                          context,
                          AppColors.white.withOpacity(.5),
                          FontWeight.w400,
                        ),
                      ),
    
                      sdpW(context, 20).height,
    
                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: textValue.toString(),
                                    style: AppSdpFonts.fontAkrobat50sdpW(
                                      context,
                                      AppColors.white,
                                      FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${context.locales.RC}',
                                    style: AppSdpFonts.fontAkrobat50sdpW(
                                      context,
                                      AppColors.refYellowLight,
                                      FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: effectiveBorderWidth,
              top: effectiveBorderWidth,
              bottom: effectiveBorderWidth,
            ),
            decoration: ShapeDecoration(
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.only(
                  topLeft: SmoothRadius(
                    cornerRadius: radius - effectiveBorderWidth,
                    cornerSmoothing: smoothing,
                  ),
                  bottomLeft: SmoothRadius(
                    cornerRadius: radius - effectiveBorderWidth,
                    cornerSmoothing: smoothing,
                  ),
                  topRight: SmoothRadius.zero,
                  bottomRight: SmoothRadius.zero,
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.white.withOpacity(.15), AppColors.white.withOpacity(.05)],
              ),
              color:
                  leftFillColor ??
                  (leftFillGradientColors == null
                      ? (isAccumulated
                            ? AppColors.refGreenDark2
                            : AppColors.refGrey2.withOpacity(.8))
                      : null),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightContainer(
    BuildContext context,
    double effectiveHeight,
    double radius,
    double smoothing,
    double effectiveBorderWidth,
  ) {
    return TapAnimation(
      onTap: onTap,
      child: Container(
        height: effectiveHeight,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.only(
              topLeft: SmoothRadius.zero,
              bottomLeft: SmoothRadius.zero,
              topRight: SmoothRadius(cornerRadius: radius, cornerSmoothing: smoothing),
              bottomRight: SmoothRadius(cornerRadius: radius, cornerSmoothing: smoothing),
            ),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.only(
                    topLeft: SmoothRadius.zero,
                    bottomLeft: SmoothRadius.zero,
                    topRight: SmoothRadius(
                      cornerRadius: radius - effectiveBorderWidth,
                      cornerSmoothing: smoothing,
                    ),
                    bottomRight: SmoothRadius(
                      cornerRadius: radius - effectiveBorderWidth,
                      cornerSmoothing: smoothing,
                    ),
                  ),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: rightFillGradientColors,
                ),
              ),
              child:
                  rightChild ??
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: addIconPaddingLeft ?? sdpW(context, 48),
                      ),
                      child: Text(
                        context.locales.ref_claim.toUpperCase(),
                        style: AppSdpFonts.fontHalvar50sdpW(context, AppColors.black, FontWeight.w500),
                      ),
                    ),
                  ),
            ),

            Container(
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.only(
                    topLeft: SmoothRadius.zero,
                    bottomLeft: SmoothRadius.zero,
                    topRight: SmoothRadius(
                      cornerRadius: radius - effectiveBorderWidth,
                      cornerSmoothing: smoothing,
                    ),
                    bottomRight: SmoothRadius(
                      cornerRadius: radius - effectiveBorderWidth,
                      cornerSmoothing: smoothing,
                    ),
                  ),
                ),
                color: isActiveButton ? AppColors.transparent : AppColors.black.withOpacity(.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
