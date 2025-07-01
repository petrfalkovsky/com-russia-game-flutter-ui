import 'dart:math' as math;

import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_images.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/accumulated_widget.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/balance_widget.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/close_widget.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/improve_widget.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/promocode_widget.dart';
import 'package:flutter/material.dart';

class ReferralProgramScreen extends StatelessWidget {
  const ReferralProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _sdp(double value) => sdpW(context, value) * 1.08;

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// ФОН
            Positioned.fill(child: Image.asset(AppImages.refBg, fit: BoxFit.cover)),

            /// ОСНОВНОЙ КОНТЕНТ СПРАВА
            Positioned(
              top: _sdp(40),
              right: _sdp(92),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// ЭППБАР: БАЛАНС РУБ, БАЛАНС RC, КНОПКА ЗАКРЫТЬ
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      /// БАЛАНС РУБ
                      BalanceWidget(
                        balanceValue: 190990.toString(),
                        isGreyView: true,
                        height: _sdp(100),
                        cornerRadius: _sdp(30),
                        borderWidth: _sdp(2),
                        iconSize: _sdp(60),
                        containerMargin: EdgeInsets.all(_sdp(2)),
                        textHorizontalPadding: EdgeInsets.symmetric(horizontal: _sdp(30)),
                        addIconPaddingLeft: _sdp(32),
                        addIconPaddingRight: _sdp(32 + 3),
                        outerBlurRadius: _sdp(60),
                        innerBlurRadius: _sdp(50),
                        fillGradientColors: [
                          Colors.grey.withOpacity(.0),
                          Colors.grey.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                        ],
                        rightBorderGradientColors: [
                          Colors.grey.withOpacity(.2),
                          Colors.grey,
                          Colors.grey.withOpacity(.2),
                        ],
                      ),

                      _sdp(28).width,

                      /// БАЛАНС RC
                      BalanceWidget(
                        balanceValue: 990.toString(),
                        height: _sdp(100),
                        cornerRadius: _sdp(30),
                        borderWidth: _sdp(2),
                        iconSize: _sdp(60),
                        containerMargin: EdgeInsets.all(_sdp(2)),
                        textHorizontalPadding: EdgeInsets.symmetric(horizontal: _sdp(30)),
                        addIconPaddingLeft: _sdp(32),
                        addIconPaddingRight: _sdp(32 + 3),
                        outerBlurRadius: _sdp(60),
                        innerBlurRadius: _sdp(50),
                      ),

                      _sdp(80).width,

                      /// КНОПКА ЗАКРЫТЬ
                      CloseWidget(
                        size: _sdp(100),
                        cornerRadius: _sdp(30),
                        borderWidth: _sdp(1),
                        iconSize: _sdp(40),
                      ),
                    ],
                  ),

                  _sdp(67).height,

                  /// КНОПКИ КОПИРОВАТЬ ПРОМОКОД, ПОДЕЛИТЬСЯ, НАКОПЛЕНИЯ ЗАБРАТЬ
                  SizedBox(
                    width: _sdp(823 * 0.99),
                    child: Column(
                      children: [
                        /// КНОПКИ КОПИРОВАТЬ ПРОМОКОД, ПОДЕЛИТЬСЯ
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// ТВОЙ ПРОМОКОД
                            PromocodeWidget(
                              textValue: 'A1B2C3D4',
                              height: _sdp(150),
                              addIconPaddingLeft: _sdp(48),
                              addIconPaddingRight: _sdp(48),
                              borderWidth: _sdp(2),
                              borderGradientColors: [
                                Colors.grey.withOpacity(.1),
                                Colors.grey.withOpacity(.3),
                                Colors.transparent,
                              ],
                              iconSize: _sdp(50),
                              secondIconSize: _sdp(60),
                              cornerRadius: _sdp(40),
                              copyIconSize: _sdp(47),
                              onTapCopy: () {},
                              onTapEdit: () {},
                            ),

                            /// КНОПКА ПОДЕЛИТЬСЯ
                            CloseWidget(
                              iconPath: AppImages.refShare,
                              size: _sdp(150),
                              fillGradientColors: [
                                AppColors.refYellowLight1,
                                AppColors.refYellowDark2,
                              ],
                              cornerRadius: _sdp(40),
                              borderWidth: _sdp(0),
                              iconSize: _sdp(60),
                              iconColor: AppColors.black,
                            ),
                          ],
                        ),

                        _sdp(48).height,
                        // % ОТ ДОНАТА
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // % ОТ ДОНАТА, приведенных рефералов
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.locales.ref_donate_procent
                                      .replaceAll('%d', '1')
                                      .toLowerCase(),
                                  style: AppFonts.fontHalvar50sdpW(
                                    context,
                                    AppColors.white,
                                    FontWeight.w800,
                                  ),
                                ),

                                _sdp(16).height,

                                Text(
                                  context.locales.ref_referrers
                                      .replaceAll('%d', '25')
                                      .toLowerCase(),
                                  style: AppFonts.fontHalvar30sdpW(
                                    context,
                                    AppColors.white.withOpacity(.7),
                                    FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),

                            // КНОПКА УЛУЧШИТЬ
                            ImproveWidget(
                              // функционал
                              onTap: () {},
                              upgradePercent: 25,
                              isUpgraded: true,

                              // св-ва
                              height: _sdp(100),
                              width: _sdp(505),
                              cornerRadius: _sdp(30),
                              iconSize: _sdp(40),
                              spacing: _sdp(30),
                            ),
                          ],
                        ),

                        _sdp(48).height,

                        /// НАКОПЛЕНО
                        Row(
                          children: [
                            Expanded(
                              child: AccumulatedWidget(
                                // функционал виджета
                                textValue: '1901920129301',
                                onTap: () {},
                                isActiveButton: true,

                                // стильи виджета
                                leftFlex: 4,
                                rightFlex: 2,
                                height: _sdp(150),
                                borderWidth: _sdp(2),
                                leadIconPath: AppImages.refCoins,
                                leadIconSize: _sdp(60),
                                leftBorderGradientColors: [
                                  AppColors.refGrey2,
                                  AppColors.white.withOpacity(.1),
                                  AppColors.white.withOpacity(.1),
                                  AppColors.refGrey2,
                                ],
                                cornerRadius: _sdp(40),
                                leftFillGradientColors: [
                                  AppColors.refGrey2,
                                  AppColors.refGrey2,
                                  AppColors.refGrey2,
                                ],
                                rightFillGradientColors: [
                                  AppColors.refGreenLight1,
                                  AppColors.refGreenDark2,
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
            ),

            /// ОСНОВНОЙ КОНТЕНТ СЛЕВА
            // ПРОГРАММА
            Positioned(
              top: _sdp(66),
              left: _sdp(467),
              child: Transform.rotate(
                angle: 3.16 * math.pi / 180,
                child: Container(
                  height: _sdp(60),
                  width: _sdp(299),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_sdp(100)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [AppColors.refYellowLight, AppColors.refYellowDark],
                      stops: [0.5, 0.99],
                    ),
                  ),
                  child: Center(
                    // искажение
                    child: Transform.scale(
                      scaleX: 1.9, // по горизонтали
                      scaleY: 1.1, // по вертикали
                      child: Text(
                        context.locales.ref_program.toUpperCase(),
                        style:
                            AppFonts.fontAkrobat32sdpW(
                              context,
                              AppColors.refBrown,
                              FontWeight.w800,
                            ).copyWith(
                              letterSpacing: -.3,
                              height: sdpW(context, 38) / sdpW(context, 32),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // РЕФЕРАЛЬНАЯ, ОПИСАНИЕ
            Positioned(
              top: _sdp(96),
              left: _sdp(92),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locales.ref_referral.toUpperCase(),
                    style: AppFonts.fontAkrobat120sdpW(context, AppColors.white, FontWeight.w900),
                  ),

                  _sdp(36).height,

                  Text(
                    context.locales.ref_description,
                    style: AppFonts.fontHalvar36sdpW(
                      context,
                      AppColors.white.withOpacity(.6),
                      FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
