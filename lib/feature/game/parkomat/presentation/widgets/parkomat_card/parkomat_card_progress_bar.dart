import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/adaptive_widget.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/scale_context_util.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:flutter/material.dart';

class ParkomatCardProgressBar extends AdaptiveWidget {
  final double progress;
  final String leftText;
  final String rightText1;
  final String rightText2;
  final double height;
  final double progressBarHeight;
  final double borderRadius;
  final Color activeColor;
  final Color inactiveColor;
  final TextStyle? textStyle;

  const ParkomatCardProgressBar({
    super.key,
    required this.progress,
    required this.leftText,
    required this.rightText1,
    required this.rightText2,
    this.height = 80,
    this.progressBarHeight = 6,
    this.borderRadius = 3,
    this.activeColor = Colors.yellow,
    this.inactiveColor = const Color(0x80FFFFFF),
    this.textStyle,
  });

  @override
  Widget buildAdaptive(BuildContext context) {
    final effectiveTextStyle =
        textStyle ?? AppFonts.fontAkrobat35(context, AppColors.white, FontWeight.w400);

    return SizedBox(
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Верхний дивайдер всегда сверху
          _buildGradientDivider(context),

          // Основной контент
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Текст
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        leftText,
                        style: effectiveTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: rightText1,
                              style: AppFonts.fontAkrobat35(
                                context,
                                AppColors.white,
                                FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: rightText2,
                              style: AppFonts.fontAkrobat35(
                                context,
                                AppColors.white,
                                FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      /// если ричте
                      // Text(
                      //   rightText,
                      //   style: effectiveTextStyle,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ),
                  ],
                ),

                // Прогресс бар
                SizedBox(
                  width: double.infinity,
                  height: progressBarHeight,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      // Неактивная часть
                      Container(
                        width: double.infinity,
                        height: progressBarHeight,
                        decoration: BoxDecoration(
                          color: inactiveColor,
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                      ),

                      // Активная часть
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: progress.clamp(0.0, 1.0),
                        child: Container(
                          height: progressBarHeight,
                          decoration: BoxDecoration(
                            color: activeColor,
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Нижний дивайдер всегда снизу
          _buildGradientDivider(context),
        ],
      ),
    );
  }

  Widget _buildGradientDivider(context) {
    return Container(
      height: scale(1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.0),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
