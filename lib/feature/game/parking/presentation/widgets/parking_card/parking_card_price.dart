import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:flutter/material.dart';

class ParkingCardPrice extends StatelessWidget {
  final double height;
  final TextStyle? textStyle;
  final String? rightText;

  const ParkingCardPrice({super.key, this.height = 80, this.textStyle, this.rightText});

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle =
        textStyle ?? AppFonts.fontAkrobat35(context, AppColors.white, FontWeight.w400);

    return SizedBox(
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildGradientDivider(context),

          // текст
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: rightText,
                          style: AppFonts.fontHalvar45(context, AppColors.white, FontWeight.w500),
                        ),
                        TextSpan(
                          text: ' ${context.locales.rub}',
                          style: AppFonts.fontHalvar45(context, AppColors.green, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

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
