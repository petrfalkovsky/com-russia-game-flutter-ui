import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/custom_animated_click.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/squirqle_gradient_border.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:flutter/material.dart';

class ParkomatCardPrice extends StatelessWidget {
  final double height;
  final TextStyle? textStyle;
  final String? rightText;
  final VoidCallback? onButtonPressed;
  final bool isActive;

  const ParkomatCardPrice({
    super.key,
    this.height = 80,
    this.textStyle,
    this.rightText,
    this.onButtonPressed,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Основной контейнер с градиентными границами
        Expanded(
          child: SizedBox(
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
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: rightText,
                                style: AppFonts.fontHalvar45(
                                  context,
                                  AppColors.white,
                                  FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: ' ${context.locales.rub}',
                                style: AppFonts.fontHalvar45(
                                  context,
                                  AppColors.green,
                                  FontWeight.w500,
                                ),
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
          ),
        ),

        Expanded(
          child: TapAnimation(
            onTap: isActive ? onButtonPressed : null,
            child: SquirqleGradientBorder(
              height: scale(120),
              borderWidth: 0,
              cornerRadius: scale(30),
              cornerSmoothing: 1.0,

              // желтый градиент
              fillGradientColors: [AppColors.refYellowLight1, AppColors.refYellowDark2],
              fillGradientBegin: Alignment.topLeft,
              fillGradientEnd: Alignment.bottomRight,

              // затемнение
              background2: isActive
                  ? null
                  : BackgroundConfig(
                      colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.5)],
                      isRadial: false,
                      gradientBegin: Alignment.topCenter,
                      gradientEnd: Alignment.bottomCenter,
                    ),

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: scale(42)),
                child: Center(
                  child: Text(
                    context.locales.parking_get.toUpperCase(),
                    style: AppFonts.fontHalvar50(
                      context,
                      isActive
                          ? AppColors.black
                          : AppColors.black.withOpacity(0.6),
                      FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradientDivider(context) {
    return Container(
      height: scale(1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.0),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
