import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/squirqle_gradient_border.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkomatCardDetails extends StatelessWidget {
  const ParkomatCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// БАЗОВЫЙ КОНТЕЙНЕР ДЛЯ КАРТОЧКИ
        SquirqleGradientBorder(
          padding: EdgeInsets.only(left: scale(20), right: scale(20)),
          width: scale(380),
          height: scale(268),

          // границы
          borderWidth: scale(2),
          cornerRadius: scale(40),
          cornerSmoothing: 1.0,
          borderGradientColors: [AppColors.white.withOpacity(.65), AppColors.white.withOpacity(.0)],
          borderGradientStops: [0.0, 1.0],
          borderGradientRadius: 0.99,

          // фон-изображения
          imagePath0: AppWepb.parkingCardBg0,
          imagePath1: AppWepb.parkingCardBg1,
          isSvg0: false,
          isSvg1: false,
          boxFit0: BoxFit.cover,

          // градиент фона
          fillGradientColors: [
            Colors.white.withOpacity(.3),
            AppColors.white.withOpacity(.05),
            AppColors.white.withOpacity(.0),
          ],
          fillGradientStops: [0.0, 0.5, 1.0],
          fillGradientRadius: 1.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: scale(24)),

              /// ИЗОБРАЖЕНИЕ
              Image.asset(
                width: scale(270),
                height: scale(152),
                AppWepb.parkingDefaultCar,
                fit: BoxFit.contain,
              ),

              SizedBox(height: scale(10)),

              /// ЗАГОЛОВОК КАРТОЧКИ
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: sdp(context, 250),
                  child: Text(
                    context.locales.parking_default_car_name.toUpperCase(),
                    style: AppFonts.fontAkrobat25(context, AppColors.white, FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          right: 0,
          child: Transform.translate(
            offset: Offset(scale(8), scale(-5)),
            child: SvgPicture.asset(
              width: scale(195),
              height: scale(45),
              AppVectors.parkingCarPlatesRus,
            ),
          ),
        ),
      ],
    );
  }
}
