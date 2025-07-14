import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/car_plate_widget.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_models.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
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

                    const SizedBox(height: 20),

                    /// ТЕСТ ВСЕХ НОМЕРОВ
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Россия - как приходит с сервера
                            _buildPlateExample(
                              context,
                              'Россия (с сервера)',
                              PlateCountry.ru,
                              const PlateParts('М777ММ', '777'),
                            ),

                            // Украина - как приходит с сервера
                            _buildPlateExample(
                              context,
                              'Украина (с сервера)',
                              PlateCountry.ua,
                              const PlateParts('9265', 'КМ', 'КМ'),
                            ),

                            // Казахстан - как приходит с сервера
                            _buildPlateExample(
                              context,
                              'Казахстан (с сервера)',
                              PlateCountry.kz,
                              const PlateParts('999EPA', '02'),
                            ),

                            // Беларусь - как приходит с сервера
                            _buildPlateExample(
                              context,
                              'Беларусь (с сервера)',
                              PlateCountry.by,
                              const PlateParts('6246', '7', 'AB'),
                            ),

                            // Эксклюзивный
                            _buildPlateExample(
                              context,
                              'Эксклюзивный',
                              PlateCountry.exclusive,
                              const PlateParts(''),
                            ),

                            // Пустой номер
                            _buildPlateExample(
                              context,
                              'Пустой номер',
                              PlateCountry.none,
                              const PlateParts(''),
                            ),

                            const SizedBox(height: 40),

                            /// ТЕСТОВЫЕ ВАРИАНТЫ ДЛЯ РЕДАКТИРОВАНИЯ
                            const Text(
                              'Редактируемые номера:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),

                            _buildEditablePlateExample(
                              context,
                              'Россия (редактируемый)',
                              PlateCountry.ru,
                              const PlateParts('A123BC', '77'),
                            ),

                            _buildEditablePlateExample(
                              context,
                              'Казахстан (редактируемый)',
                              PlateCountry.kz,
                              const PlateParts('123ABC', '01'),
                            ),

                            _buildEditablePlateExample(
                              context,
                              'Украина (редактируемый)',
                              PlateCountry.ua,
                              const PlateParts('1234', 'AA', 'BB'),
                            ),

                            _buildEditablePlateExample(
                              context,
                              'Беларусь (редактируемый)',
                              PlateCountry.by,
                              const PlateParts('1234', '1', 'AB'),
                            ),
                          ],
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

  Widget _buildPlateExample(
    BuildContext context,
    String title,
    PlateCountry country,
    PlateParts parts,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // Text(
          //   title,
          //   style: AppFonts.fontHalvar32(context, AppColors.refPurpleDark2.withOpacity(.5), FontWeight.w500),
          // ),
          // const SizedBox(height: 8),
          SizedBox(
            width: scale(1950),
            child: CarPlateWidget(plateCountry: country, parts: parts, editable: false),
          ),
          const SizedBox(height: 4),
          // Text(
          //   'number: "${parts.number}", region: "${parts.region}", serial: "${parts.serial}"',
          //   style: const TextStyle(fontSize: 12, color: Colors.grey),
          // ),
        ],
      ),
    );
  }

  Widget _buildEditablePlateExample(context, String title, PlateCountry country, PlateParts parts) {
    return _EditablePlateWidget(title: title, country: country, initialParts: parts);
  }
}

class _EditablePlateWidget extends StatefulWidget {
  final String title;
  final PlateCountry country;
  final PlateParts initialParts;

  const _EditablePlateWidget({
    required this.title,
    required this.country,
    required this.initialParts,
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: scale(1950),
            child: CarPlateWidget(
              plateCountry: widget.country,
              parts: parts,
              editable: true,
              onChanged: (newParts) {
                setState(() {
                  parts = newParts;
                });
                print(
                  '${widget.title} изменен: number="${newParts.number}", region="${newParts.region}", serial="${newParts.serial}"',
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'number: "${parts.number}", region: "${parts.region}", serial: "${parts.serial}"',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
