import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/car_plate_widget.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_models.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/adaptive_widget.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/scale_context_util.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parkomat/presentation/widgets/parkomat_appbar.dart';
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

                    const SizedBox(height: 20),

                    /// ТЕСТ ВСЕХ НОМЕРОВ
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: scale(1495),
                          child: Column(
                            children: [
                              // Россия - как приходит с сервера
                              CarPlateWidget(
                                plateCountry: PlateCountry.ru,
                                parts: const PlateParts('М777ММ', '777'),
                                editable: false,
                                scaleFactor: 1.0,
                              ),

                              SizedBox(height: 20),

                              // Украина - как приходит с сервера
                              CarPlateWidget(
                                plateCountry: PlateCountry.ua,
                                parts: const PlateParts('9265', 'КМ', 'КМ'),
                                editable: false,
                                scaleFactor: 1.0,
                              ),

                              const SizedBox(height: 20),

                              // Казахстан - как приходит с сервера
                              CarPlateWidget(
                                plateCountry: PlateCountry.kz,
                                parts: const PlateParts('999EPA', '02'),
                                editable: false,
                                scaleFactor: 1.0,
                              ),

                              const SizedBox(height: 20),

                              // Беларусь - как приходит с сервера
                              CarPlateWidget(
                                plateCountry: PlateCountry.by,
                                parts: const PlateParts('6246', '7', 'AB'),
                                editable: false,
                                scaleFactor: 1.0,
                              ),

                              const SizedBox(height: 20),

                              // Пустой номер
                              CarPlateWidget(
                                plateCountry: PlateCountry.none,
                                parts: const PlateParts(''),
                                editable: false,
                                scaleFactor: 1.0,
                              ),
                            ],
                          ),
                        ),
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

class _EditablePlateWidget extends StatefulWidget {
  final PlateCountry country;
  final PlateParts initialParts;
  final double scaleFactor;

  const _EditablePlateWidget({
    required this.country,
    required this.initialParts,
    this.scaleFactor = 1.0,
  });

  @override
  State<_EditablePlateWidget> createState() => _EditablePlateWidgetState();
}

class _EditablePlateWidgetState extends State<_EditablePlateWidget> {
  late PlateParts parts;

  @override
  void initState() {
    super.initState();
    parts = widget.initialParts;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: scale(195),
      child: CarPlateWidget(
        plateCountry: widget.country,
        parts: parts,
        editable: true,
        scaleFactor: widget.scaleFactor,
        onChanged: (newParts) {
          setState(() {
            parts = newParts;
          });
          print(
            'Номер изменен: number="${newParts.number}", region="${newParts.region}", serial="${newParts.serial}"',
          );
        },
      ),
    );
  }
}
