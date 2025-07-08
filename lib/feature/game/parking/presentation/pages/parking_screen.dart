import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parking/presentation/widgets/parking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _sdp(double value) => sdpW(context, value) * 1.08;

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(),
            Column(),
            /// ФОН
            Positioned.fill(child: SvgPicture.asset(AppVectors.parkingBg, fit: BoxFit.cover)),

            /// ОСНОВНОЙ КОНТЕНТ
            ParkingCard(
              width: _sdp(573),
              height: _sdp(816),
              cornerRadius: _sdp(30),
              borderWidth: _sdp(2),
            ),
          ],
        ),
      ),
    );
  }
}
