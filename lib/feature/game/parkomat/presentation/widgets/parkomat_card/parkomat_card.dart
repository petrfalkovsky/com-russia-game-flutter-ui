import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/string_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/car_plate_widget.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/squirqle_gradient_border.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/adaptive_widget.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/scale_context_util.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/domain/mock_plate_data.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card/parkomat_card_price.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card/parkomat_card_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum BorderState {
  normal, // текущее состояние
  dimmed, // прозрачность в половину меньше
  active, // толстые желтые границы и желтая иконка
}

class ParkomatCard extends AdaptiveWidget {
  final MockPlateData? mockPlateData; // ← Добавляем параметр для мок данных

  const ParkomatCard({super.key, this.mockPlateData});

  @override
  Widget buildAdaptive(BuildContext context) {
    BorderState currentState = BorderState.normal;

    final double progress = 0.4;
    final double liters = 80;
    final double maxLiters = 150;

    final prgressProcent = progress * 100;
    final fuelProgress = liters / maxLiters;

    final literUnit = context.locales.parking_l.replaceAll('%d', '').trim();

    // данные номера (мок или дефолтные)
    final plateData = mockPlateData ?? MockPlatesData.mockPlates.first;

    return Stack(
      alignment: Alignment.center,
      children: [
        // НАРУЖНЫЙ КОНТЕЙНЕР
        SizedBox(width: scale(573 * 1.03)),

        // ОСНОВНОЙ КОНТЕНТ КАРТОЧКИ
        SizedBox(
          width: scale(573),
          height: scale(806),
          child: Stack(
            children: [
              /// БАЗОВЫЙ КОНТЕЙНЕР ДЛЯ КАРТОЧКИ
              SquirqleGradientBorder(
                padding: EdgeInsets.only(
                  right: scale(20),
                  left: scale(36),
                  top: scale(55 - 15),
                  bottom: scale(20),
                ),
                width: scale(573),
                height: scale(806),
                borderWidth: scale(2),
                cornerRadius: scale(40),
                cornerSmoothing: 1.0,
                borderGradientColors: [
                  AppColors.white.withOpacity(.65),
                  AppColors.white.withOpacity(.0),
                ],
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
                        width: sdp(context, 420),
                        child: Text(
                          context.locales.parking_default_car_name.toUpperCase(),
                          style: AppFonts.fontAkrobat35(context, AppColors.white, FontWeight.w700),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    SizedBox(height: scale(18)),

                    /// ИЗОБРАЖЕНИЕ
                    Image.asset(
                      width: scale(465),
                      height: scale(262),
                      AppWepb.parkingDefaultCar,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: scale(24)),

                    /// СОСТОЯНИЕ
                    Row(
                      children: [
                        /// СОСТОЯНИЕ ПРОГРЕСС БАР
                        Expanded(
                          child: ParkomatCardProgressBar(
                            progress: progress,
                            leftText: context.locales.parking_state,
                            rightText1: context.locales.parking_procent
                                .replaceAll('%d', '${prgressProcent.toInt()}')
                                .toLowerCase(),
                            rightText2: '',
                            height: scale(85),
                            progressBarHeight: scale(5),
                            activeColor: AppColors.parkingYellow,
                            inactiveColor: Colors.white.withOpacity(0.3),
                            textStyle: AppFonts.fontAkrobat35(
                              context,
                              AppColors.white.withOpacity(.5),
                              FontWeight.w400,
                            ),
                          ),
                        ),

                        SizedBox(width: scale(35)),

                        /// ИКОНКА РЕМОНТ
                        SquirqleGradientBorder(
                          // размеры
                          width: scale(85),
                          height: scale(85),
                          borderWidth: currentState == BorderState.active ? scale(5) : scale(2),
                          cornerRadius: scale(25),

                          // границы
                          isLinearBorderGradient: true,
                          borderGradientBegin: Alignment.bottomLeft,
                          borderGradientEnd: Alignment.topRight,
                          borderGradientColors: currentState == BorderState.active
                              ? [
                                  AppColors.parkingYellow,
                                  AppColors.parkingYellow,
                                  AppColors.parkingYellow,
                                ]
                              : [
                                  AppColors.white.withOpacity(
                                    currentState == BorderState.dimmed ? .15 : .3,
                                  ),
                                  AppColors.white.withOpacity(.0),
                                  AppColors.white.withOpacity(
                                    currentState == BorderState.dimmed ? .15 : .3,
                                  ),
                                ],
                          borderGradientStops: [0.0, 0.55, 1.0],

                          // заливка
                          fillGradientBegin: Alignment.topLeft,
                          fillGradientEnd: Alignment.bottomRight,
                          fillGradientColors: [
                            AppColors.white.withOpacity(
                              currentState == BorderState.dimmed ? .025 : .05,
                            ),
                            AppColors.white.withOpacity(.0),
                          ],
                          fillGradientStops: [0.0, 1.0],

                          isSvg0: false,
                          isSvg1: false,
                          boxFit0: BoxFit.cover,
                          cornerSmoothing: 1.0,
                          child: Align(
                            heightFactor: null,
                            widthFactor: null,
                            child: SvgPicture.asset(
                              AppVectors.parkingRepair,
                              width: scale(50),
                              colorFilter: ColorFilter.mode(
                                currentState == BorderState.active
                                    ? AppColors.parkingYellow
                                    : currentState == BorderState.dimmed
                                    ? AppColors.white.withOpacity(0.4)
                                    : AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: scale(35)),

                    /// ТОПЛИВО
                    Row(
                      children: [
                        /// СОСТОЯНИЕ ПРОГРЕСС БАР
                        Expanded(
                          child: ParkomatCardProgressBar(
                            progress: fuelProgress,
                            leftText: context.locales.parking_oil,
                            rightText1: '${liters.toInt()} $literUnit',
                            rightText2: ' / ${maxLiters.toInt()} $literUnit',
                            height: scale(85),
                            progressBarHeight: scale(5),
                            activeColor: AppColors.parkingYellow,
                            inactiveColor: Colors.white.withOpacity(0.3),
                            textStyle: AppFonts.fontAkrobat35(
                              context,
                              AppColors.white.withOpacity(.5),
                              FontWeight.w400,
                            ),
                          ),
                        ),

                        SizedBox(width: scale(35)),

                        /// ИКОНКА РЕМОНТ
                        SquirqleGradientBorder(
                          // размеры
                          width: scale(85),
                          height: scale(85),
                          borderWidth: currentState == BorderState.active ? scale(6) : scale(2),
                          cornerRadius: scale(25),

                          // границы
                          isLinearBorderGradient: true,
                          borderGradientBegin: Alignment.bottomLeft,
                          borderGradientEnd: Alignment.topRight,
                          borderGradientColors: currentState == BorderState.active
                              ? [
                                  AppColors.parkingYellow,
                                  AppColors.parkingYellow,
                                  AppColors.parkingYellow,
                                ]
                              : [
                                  AppColors.white.withOpacity(
                                    currentState == BorderState.dimmed ? .15 : .3,
                                  ),
                                  AppColors.white.withOpacity(.0),
                                  AppColors.white.withOpacity(
                                    currentState == BorderState.dimmed ? .15 : .3,
                                  ),
                                ],
                          borderGradientStops: [0.0, 0.55, 1.0],

                          // заливка
                          fillGradientBegin: Alignment.topLeft,
                          fillGradientEnd: Alignment.bottomRight,
                          fillGradientColors: [
                            AppColors.white.withOpacity(
                              currentState == BorderState.dimmed ? .025 : .05,
                            ),
                            AppColors.white.withOpacity(.0),
                          ],
                          fillGradientStops: [0.0, 1.0],

                          isSvg0: false,
                          isSvg1: false,
                          boxFit0: BoxFit.cover,
                          cornerSmoothing: 1.0,
                          child: Align(
                            heightFactor: null,
                            widthFactor: null,
                            child: SvgPicture.asset(
                              AppVectors.parkingOil,
                              width: scale(50),
                              colorFilter: ColorFilter.mode(
                                currentState == BorderState.active
                                    ? AppColors.parkingYellow
                                    : currentState == BorderState.dimmed
                                    ? AppColors.white.withOpacity(0.4)
                                    : AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: scale(45)),

                    ParkomatCardPrice(
                      isActive: true,
                      height: scale(120),
                      rightText: '120000'.formatPriceWithSpaces,
                      onButtonPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ВИДЖЕТ НОМЕРА
        Positioned(
          top: scale(0), 
          right: scale(0),
          child: SizedBox(
            width: scale(195),
            height: scale(45),
            child: CarPlateWidget(
              plateCountry: plateData.plateCountry,
              parts: plateData.toPlateParts(),
              editable: false,
              scaleFactor: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}
