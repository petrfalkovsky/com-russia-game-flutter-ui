import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/adaptive_widget.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/scale_context_util.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_appbar.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/plates.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkomatTestScreenScreen extends AdaptiveWidget {
  const ParkomatTestScreenScreen({super.key});

  @override
  Widget buildAdaptive(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// ФОН
              Positioned.fill(child: SvgPicture.asset(AppVectors.parkingBg, fit: BoxFit.cover)),

              /// ОСНОВНОЙ КОНТЕНТ
              Padding(
                padding: EdgeInsets.only(left: scale(90), top: scale(40), bottom: scale(63)),
                child: Column(
                  children: [
                    /// ЭППБАР
                    ParkomatAppBar(),

                    Center(
                      child: LicensePlateWidget(
                        width: scale(1950),
                        height: scale(450),
                        plateInfo: PlateInfo(
                          region: '777',
                          number: 'A777AA', // или 'A 777 AA' - виджет обработает
                          country: 'RU',
                        ),
                        onTap: () {},
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
}
