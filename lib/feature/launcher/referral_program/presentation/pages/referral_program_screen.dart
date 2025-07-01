import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_images.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/balance_widget.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/close_widget.dart';
import 'package:flutter/material.dart';

class ReferralProgramScreen extends StatelessWidget {
  const ReferralProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _sdp(double value) => sdpW(context, value) * 1;

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
                  /// ЭППБАР
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      /// БАЛАНС РУБ
                      BalanceWidget(
                        balanceValue: 190990.toString(),
                        isCurrencyView: true,
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

                  /// ЭППБАР
                  Align(
                    alignment: Alignment.centerRight,
                    child: CloseWidget(
                      iconPath: AppImages.refShare,
                      size: _sdp(150),
                      fillGradientColors: [AppColors.refYellowLight1, AppColors.refYellowDark2],
                      cornerRadius: _sdp(40),
                      borderWidth: _sdp(0),
                      iconSize: _sdp(60),
                      iconColor: AppColors.black,
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
