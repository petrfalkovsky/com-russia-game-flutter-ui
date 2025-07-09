import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/squirqle_gradient_border.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_sdp_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parking/presentation/widgets/parking_card_progress_bar.dart';
import 'package:flutter/material.dart';

class ParkingCard extends StatelessWidget {
  const ParkingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final prgress = 0.4;
    final prgressProcent = prgress * 100;

    return Stack(
      children: [
        /// БАЗОВЫЙ КОНТЕЙНЕР ДЛЯ КАРТОЧКИ
        SquirqleGradientBorder(
          width: scale(573),
          height: scale(806),
          borderWidth: scale(2),
          cornerRadius: scale(40),
          cornerSmoothing: 1.0,
          borderGradientColors: [AppColors.white.withOpacity(.65), AppColors.white.withOpacity(.0)],
          borderGradientStops: [0.0, 1.0],
          borderGradientRadius: 0.99,
          imagePath0: AppWepb.parkingCardBg0,
          imagePath1: AppWepb.parkingCardBg1,
          isSvg0: false,
          isSvg1: false,
          boxFit0: BoxFit.cover,
          fillGradientColors: [
            Colors.white.withOpacity(.12),
            AppColors.white.withOpacity(.05),
            AppColors.white.withOpacity(.0),
          ],
          fillGradientStops: [0.0, 0.5, 1.0],
          fillGradientRadius: 1.7,
          child: Column(
            children: [
              /// ЗАГОЛОВОК КАРТОЧКИ
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: sdp(context, 370),
                  child: Text(
                    context.locales.parking_default_car_name.toUpperCase(),
                    style: AppFonts.fontAkrobat34(
                      context,
                      AppColors.white.withOpacity(0.3),
                      FontWeight.w700,
                    ),
                    // TextStyle(
                    //   color: AppColors.white,
                    //   fontSize: scale(35),
                    //   fontWeight: FontWeight.w400,
                    // ),
                  ),
                ),
              ),

              Image.asset(AppWepb.parkingDefaultCar, width: scale(465)),

              ParkingCardProgressBar(
                progress: prgress,
                leftText: context.locales.parking_state,
                rightText: context.locales.parking_procent
                    .replaceAll('%d', '$prgressProcent')
                    .toLowerCase(),
                height: scale(85),
                progressBarHeight: scale(5),
                activeColor: Colors.amber,
                inactiveColor: Colors.white.withOpacity(0.3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
