import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_sdp_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ImproveWidget extends StatelessWidget {
  final double height;
  final double width;
  final double cornerRadius;
  final double iconSize;
  final double spacing;
  final int upgradePercent;
  final String? iconPath;
  final List<Color>? gradientColors;
  final VoidCallback? onTap;
  final bool isUpgraded;

  const ImproveWidget({
    super.key,
    required this.height,
    required this.width,
    required this.cornerRadius,
    required this.iconSize,
    required this.spacing,
    required this.upgradePercent,
    required this.isUpgraded,
    this.iconPath,
    this.gradientColors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isUpgraded
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(cornerRadius),
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                        AppColors.refPurpleLight1.withOpacity(0.8),
                      AppColors.refPurpleDark2.withOpacity(0.9),
                    
                    ],
                  ),
                  width: sdpW(context, 2),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors:
                      gradientColors?.map((color) => color.withOpacity(0.1)).toList() ??
                      [
                        AppColors.refPurpleDark2.withOpacity(0.1),
                        AppColors.refPurpleLight1.withOpacity(0.1),
                      ],
                  stops: [0.5, 0.99],
                ),
              ),
              child: _buildContent(context),
            )
          : Container(
              height: height,
              width: width,
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.all(
                    SmoothRadius(cornerRadius: cornerRadius, cornerSmoothing: 1),
                  ),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors:
                      gradientColors ??
                      [
                        AppColors.refPurpleDark2.withOpacity(.99),
                        AppColors.refPurpleLight1.withOpacity(.99),
                      ],
                  stops: [0.0, 0.99],
                ),
              ),
              child: _buildContent(context),
            ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          isUpgraded ? AppWepb.refImproveDone : (iconPath ?? AppWepb.refImprove),
          width: iconSize,
        ),

        spacing.width,

        Text(
          isUpgraded
              ? context.locales.ref_max_upgraded.toUpperCase()
              : context.locales.ref_upgrade
                    .replaceAll('%d', upgradePercent.toString())
                    .toUpperCase(),
          style: AppSdpFonts.fontHalvar40sdpW(context, AppColors.white, FontWeight.w500),
        ),
      ],
    );
  }
}
