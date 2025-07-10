import 'dart:math' as math;

import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_sdp_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/accumulated_widget.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/balance_widget.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/close_widget.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/horizontal_cardlist.dart';
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
            Positioned.fill(child: Image.asset(AppWepb.refBg, fit: BoxFit.cover)),

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
                        onTap: () => Navigator.pop(context),
                        width: _sdp(100),
                        height: _sdp(100),
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
                              iconPath: AppWepb.refShare,

                              width: _sdp(150),
                              height: _sdp(150),
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
                                  style: AppSdpFonts.fontAkrobat50sdpW(
                                    context,
                                    AppColors.white,
                                    FontWeight.w500,
                                  ),
                                ),

                                _sdp(16).height,

                                Text(
                                  context.locales.ref_referrers
                                      .replaceAll('%d', '25')
                                      .toLowerCase(),
                                  style: AppSdpFonts.fontAkrobat30sdpW(
                                    context,
                                    AppColors.white.withOpacity(.7),
                                    FontWeight.w500,
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
                                leadIconPath: AppWepb.refCoins,
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
            // программа
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
                            AppSdpFonts.fontAkrobat32sdpW(
                              context,
                              AppColors.refBrown,
                              FontWeight.w700,
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

            // реферальная, описание
            Positioned(
              top: _sdp(96),
              left: _sdp(92),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locales.ref_referral.toUpperCase(),
                    style: AppSdpFonts.fontAkrobat120sdpW(
                      context,
                      AppColors.white,
                      FontWeight.w900,
                    ),
                  ),

                  _sdp(36).height,

                  Text(
                    context.locales.ref_description,
                    style: AppSdpFonts.fontAkrobat36sdpW(
                      context,
                      AppColors.white.withOpacity(.6),
                      FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            /// ПОДЛОЖКА ПОД ГОРИЗОНТАЛЬНЙ СПИСОК УРОВНЕЙ ПРОГРАММЫ
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: _sdp(290),
                decoration: BoxDecoration(
                  // градиентный бордер
                  border: Border(
                    top: BorderSide(width: _sdp(2), color: Colors.transparent),
                  ),

                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.white.withOpacity(0.3), Colors.transparent],
                    stops: [0.0, 0.02],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    // темный фон полупрозрачный
                    color: AppColors.refGrey2.withOpacity(0.85),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      // белый градиент поверх темного фона
                      gradient: RadialGradient(
                        radius: 6,
                        colors: [Colors.white.withOpacity(.05), Colors.white.withOpacity(0.0)],
                        stops: [0.0, 1.0],
                      ),
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(left: _sdp(91)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            context.locales.ref_you_invite,
                            style: AppSdpFonts.fontAkrobat50sdpW(
                              context,
                              AppColors.white,
                              FontWeight.w500,
                            ),
                          ),

                          _sdp(8).height,

                          Text(
                            textAlign: TextAlign.center,
                            '10 ${context.locales.ref_persons.toUpperCase()}',
                            style: AppSdpFonts.fontAkrobat70sdpW(
                              context,
                              AppColors.refYellowLight,
                              FontWeight.w800,
                            ).copyWith(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// ГОРИЗОНТАЛЬНЫЙ СПИСОК УРОВНЯ РЕФЕРАЛКИ
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: HorizontalCardsList(
                // мок
                isClaimVisible: (index) => index % 3 == 0,
                isDoneVisible: (index) => index % 5 == 0,
                isOvalActive: (index) => index % 2 == 0,

                // мок список уровней для овалов
                ovalLevels: [1, 3, 5, 7, 15, 21, 25, 30, 35, 40, 50, 60, 70, 80, 90, 100],

                // св-ва
                itemCount: 10,
                cardSize: _sdp(230),
                cardSpacing: _sdp(140),
                lineHeight: _sdp(11),
                ovalWidth: _sdp(110),
                ovalHeight: _sdp(61),
                borderWidth: _sdp(1),
                borderRadius: _sdp(40),
                buttonHeight: _sdp(66),
                buttonText: context.locales.ref_get,
                containerHeight: _sdp(290),
                invitedCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
