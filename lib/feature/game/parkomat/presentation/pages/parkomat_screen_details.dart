import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/string_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/squirqle_gradient_border.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_appbar.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card/parkomat_card.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card/parkomat_card_price.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card/parkomat_card_progress_bar.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card_details.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParkomatDetailsScreen extends StatelessWidget {
  const ParkomatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double progress = 0.4;
    final prgressProcent = progress * 100;

    return
    DevicePreview(
      enabled: true,
      builder: (context) =>
    Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// ФОН
            Positioned.fill(child: Image.asset(AppWepb.parkingSecondScreenBg, fit: BoxFit.cover)),

            /// ОСНОВНОЙ КОНТЕНТ
            Padding(
              padding: EdgeInsets.only(left: scale(90), top: scale(40), bottom: scale(63)),
              child: Column(
                children: [
                  /// ЭППБАР
                  ParkomatAppBar(
                    textStyle: AppFonts.fontHalvar100(context, AppColors.white, FontWeight.w500),
                  ),

                  /// ПОДЗАГОЛОВОК
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.locales.parking_default_car_name.toUpperCase(),
                      style: AppFonts.fontHalvar50(
                        context,
                        AppColors.white.withOpacity(.5),
                        FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  /// ОСНОВНОЙ КОНТЕНТ ЭКРАНА
                  Row(
                    children: [
                      /// ЛЕВАЯ ЧАСТЬ ЭКРАНА
                      /// СОСТОЯНИЕ ПРГРЕСС БАР, КНОПКА ПОЧИНИТЬ
                      Column(
                        children: [
                          /// СПИСОК КАРТОЧЕК АВТО
                          ParkomatCardDetails(),
                        ],
                      ),

                      /// ЦЕНТР
                      /// ИЗОБРАЖЕНИЕ
                      // Image.asset(
                      //   width: scale(950),
                      //   height: scale(534),
                      //   AppWepb.parkingDefaultCar,
                      //   fit: BoxFit.contain,
                      // ),

                      // /// ПРАВАЯ ЧАСТЬ ЭКРАНА
                      // /// СОСТОЯНИЕ ПРГРЕСС БАР, КНОПКА ПОЧИНИТЬ
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,

                      //   children: [
                      //     /// СОСТОЯНИЕ ПРГРЕСС БАР
                      //     SizedBox(
                      //       width: scale(523),
                      //       child: ParkomatCardProgressBar(
                      //         progress: progress,
                      //         leftText: context.locales.parking_state,
                      //         rightText1: context.locales.parking_procent
                      //             .replaceAll('%d', '${prgressProcent.toInt()}')
                      //             .toLowerCase(),
                      //         rightText2: '',
                      //         height: scale(85),
                      //         progressBarHeight: scale(5),
                      //         activeColor: AppColors.parkingYellow,
                      //         inactiveColor: Colors.white.withOpacity(0.3),
                      //         textStyle: AppFonts.fontAkrobat35(
                      //           context,
                      //           AppColors.white.withOpacity(.5),
                      //           FontWeight.w400,
                      //         ),
                      //       ),
                      //     ),

                      //     /// КНОПКА ПОЧИНИТЬ
                      //     SquirqleGradientBorder(
                      //       width: scale(523),
                      //       height: scale(120),
                      //       cornerRadius: scale(30),
                      //       cornerSmoothing: 1.0,
                      //       borderWidth: scale(2),

                      //       // границы
                      //       isLinearBorderGradient: true,
                      //       borderGradientBegin: Alignment.bottomLeft,
                      //       borderGradientEnd: Alignment.topRight,
                      //       borderGradientColors: [
                      //         AppColors.white.withOpacity(.15),
                      //         AppColors.white.withOpacity(.1),
                      //         AppColors.white.withOpacity(.0),
                      //         AppColors.white.withOpacity(.15),
                      //       ],
                      //       borderGradientStops: [0.0, 0.1, 0.9, 1.0],

                      //       // 2-й фон - белый с радиальным градиентом
                      //       background2: BackgroundConfig(
                      //         colors: [
                      //           Colors.white.withOpacity(0.05),
                      //           Colors.white.withOpacity(0.0),
                      //         ],
                      //         isRadial: true,
                      //         gradientCenter: Alignment.topLeft,
                      //         gradientRadius: 3.0,
                      //       ),

                      //       child: Row(
                      //         spacing: scale(27),
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           SvgPicture.asset(AppVectors.parkingRepair, width: scale(50)),

                      //           Text(
                      //             context.locales.parking_repair.toUpperCase(),
                      //             style: AppFonts.fontHalvar50(
                      //               context,
                      //               AppColors.white.withOpacity(.5),
                      //               FontWeight.w500,
                      //             ),
                      //             maxLines: 1,
                      //             overflow: TextOverflow.ellipsis,
                      //           ),
                      //         ],
                      //       ),
                      //     ),

                      //     /// ЗАБРААТЬ ЦЕНА И КНОПКА
                      //     SizedBox(
                      //       width: scale(601),
                      //       child: ParkomatCardPrice(
                      //         isActive: true,
                      //         height: scale(120),
                      //         rightText: '120000'.formatPriceWithSpaces,
                      //         onButtonPressed: () {},
                      //       ),
                      //     ),
                      //   ],
                      // ),
                
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
