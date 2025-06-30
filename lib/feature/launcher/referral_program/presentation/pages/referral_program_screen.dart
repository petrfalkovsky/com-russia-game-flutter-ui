import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
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

            /// ЭППБАР
            Positioned(
              top: _sdp(40),
              right: _sdp(92),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _sdp(28).width,

                  /// БАЛАНС RC
                  BalanceWidget(
                    height: _sdp(100),
                    cornerRadius: _sdp(30),
                    borderWidth: _sdp(1),
                    iconSize: _sdp(60),
                    containerMargin: EdgeInsets.all(_sdp(2)),
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
            ),
          ],
        ),
      ),
    );
  }
}
