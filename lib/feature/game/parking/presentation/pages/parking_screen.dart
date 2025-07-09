import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parking/presentation/widgets/parking_card.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
    DevicePreview(enabled: true, builder: (context) =>
    Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(),
            Column(),

            /// ФОН
            Positioned.fill(child: SvgPicture.asset(AppVectors.parkingBg, fit: BoxFit.cover)),

            //
            ParkingCard(),
          ],
        ),
      ),
      ),
    );
  }
}
