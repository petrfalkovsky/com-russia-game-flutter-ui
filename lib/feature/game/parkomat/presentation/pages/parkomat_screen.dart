import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_appbar.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_card/parkomat_card.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkomatScreen extends StatelessWidget {
  const ParkomatScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                    Spacer(),

                    /// СПИСОК КАРТОЧКА МАШИНЫ
                    Center(
                      child: SizedBox(
                        height: scale(806),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          separatorBuilder: (context, index) => SizedBox(width: scale(30)),
                          itemBuilder: (context, index) {
                            return ParkomatCard();
                          },
                        ),
                      ),
                    ),

                    Spacer(),
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
