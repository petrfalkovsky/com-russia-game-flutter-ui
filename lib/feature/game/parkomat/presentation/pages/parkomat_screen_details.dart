import 'dart:math' as math;

import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/string_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/squirqle_gradient_border.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_appbar.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card/parkomat_card_price.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card/parkomat_card_progress_bar.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card_details.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParkomatDetailsScreen extends StatefulWidget {
  const ParkomatDetailsScreen({super.key});

  @override
  State<ParkomatDetailsScreen> createState() => _ParkomatDetailsScreenState();
}

class _ParkomatDetailsScreenState extends State<ParkomatDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double progress = 0.4;
    final prgressProcent = progress * 100;

    return DevicePreview(
      enabled: true,
      builder: (context) => Material(
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
                    Expanded(
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              /// ЛЕВАЯ ЧАСТЬ ЭКРАНА
                              /// СПИСОК КАРТОЧЕК АВТО
                              SizedBox(
                                width: scale(380) * 1.04 + scale(25),
                                child: Stack(
                                  children: [
                                    /// КАСТОМНЫЙ СКРОЛЛБАР СЛЕВА
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: _buildCustomScrollbar(),
                                    ),

                                    /// СПИСОК КАРТОЧЕК КАК КОЛОНКА
                                    Positioned(
                                      // left: scale(20),
                                      top: 0,
                                      bottom: 0,
                                      right: 0,
                                      child: SingleChildScrollView(
                                        controller: _scrollController,
                                        child: Column(
                                          children: List.generate(8, (index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: index == 7 ? 0 : scale(20),
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedIndex = index;
                                                  });
                                                },
                                                child: ParkomatCardDetails(
                                                  isSelected: selectedIndex == index,
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// ЦЕНТР
                              /// ИЗОБРАЖЕНИЕ
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Image.asset(
                                    width: scale(950),
                                    height: scale(534),
                                    AppWepb.parkingDefaultCar,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              /// ПРАВАЯ ЧАСТЬ ЭКРАНА
                              /// СОСТОЯНИЕ ПРГРЕСС БАР, КНОПКА ПОЧИНИТЬ
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    /// СОСТОЯНИЕ ПРГРЕСС БАР
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: scale(523),
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

                                        /// КНОПКА ПОЧИНИТЬ
                                        SquirqleGradientBorder(
                                          width: scale(523),
                                          height: scale(120),
                                          cornerRadius: scale(30),
                                          cornerSmoothing: 1.0,
                                          borderWidth: scale(2),

                                          // границы
                                          isLinearBorderGradient: true,
                                          borderGradientBegin: Alignment.bottomLeft,
                                          borderGradientEnd: Alignment.topRight,
                                          borderGradientColors: [
                                            AppColors.white.withOpacity(.15),
                                            AppColors.white.withOpacity(.1),
                                            AppColors.white.withOpacity(.0),
                                            AppColors.white.withOpacity(.15),
                                          ],
                                          borderGradientStops: [0.0, 0.1, 0.9, 1.0],

                                          // 2-й фон - белый с радиальным градиентом
                                          background2: BackgroundConfig(
                                            colors: [
                                              Colors.white.withOpacity(0.05),
                                              Colors.white.withOpacity(0.0),
                                            ],
                                            isRadial: true,
                                            gradientCenter: Alignment.topLeft,
                                            gradientRadius: 3.0,
                                          ),

                                          child: Row(
                                            spacing: scale(27),
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                AppVectors.parkingRepair,
                                                width: scale(50),
                                              ),

                                              Text(
                                                context.locales.parking_repair.toUpperCase(),
                                                style: AppFonts.fontHalvar50(
                                                  context,
                                                  AppColors.white.withOpacity(.5),
                                                  FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          /// ЗАБРААТЬ ЦЕНА И КНОПКА
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: SizedBox(
                              width: scale(601),
                              child: ParkomatCardPrice(
                                isActive: true,
                                height: scale(120),
                                rightText: '120000'.formatPriceWithSpaces,
                                onButtonPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildCustomScrollbar() {
    if (!_scrollController.hasClients) return Container();

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final viewportHeight = _scrollController.position.viewportDimension;

    if (maxScroll <= 0) return Container();

    final scrollbarHeight = scale(800);
    final thumbHeight = (viewportHeight / (maxScroll + viewportHeight)) * scrollbarHeight;
    final thumbOffset = (currentScroll / maxScroll) * (scrollbarHeight - thumbHeight);

    final clampedThumbHeight = math.max(scale(20), math.min(thumbHeight, scrollbarHeight));

    return Container(
      width: scale(10),
      height: scrollbarHeight,
      margin: EdgeInsets.only(top: scale(20)),
      child: Stack(
        children: [
          // полоска скроллбара
          Positioned(
            top: thumbOffset,
            child: Container(
              width: scale(10),
              height: clampedThumbHeight,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(scale(3)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
