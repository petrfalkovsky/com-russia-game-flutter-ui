import 'package:com_russia_game_flutter_ui/core/shared_widgets/close_widget.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_images.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:flutter/material.dart';

class ReferralProgramScreen extends StatelessWidget {
  const ReferralProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _sdp(double value) => sdpW(context, value) * 1.0;

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(child: Image.asset(AppImages.refBg, fit: BoxFit.cover)),

            /// КНОПКА ЗАКРЫТЬ
            Positioned(
              top: _sdp(20),
              right: _sdp(10),
              child: GrandCloseButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
