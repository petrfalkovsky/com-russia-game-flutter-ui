import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:flutter/material.dart';

class ParkingCardProgressBar extends StatelessWidget {
  final double progress; // от 0.0 до 1.0
  final String leftText;
  final String rightText;
  final double height;
  final double progressBarHeight;
  final double borderRadius;
  final Color activeColor;
  final Color inactiveColor;
  final TextStyle? textStyle;
  

  const ParkingCardProgressBar({
    super.key,
    required this.progress,
    required this.leftText,
    required this.rightText,
    this.height = 80,
    this.progressBarHeight = 6,
    this.borderRadius = 3,
    this.activeColor = Colors.yellow,
    this.inactiveColor = const Color(0x80FFFFFF),
    this.textStyle,
    
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle =
        textStyle ?? AppFonts.fontHalvar32sdpW(context, AppColors.white, FontWeight.w400);

    return Align(
      heightFactor: null,
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Верхний дивайдер всегда сверху
            _buildGradientDivider(context),

            // Основной контент с отступами
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Текст
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(leftText, style: effectiveTextStyle),
                      Text(rightText, style: effectiveTextStyle),
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
