import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_models.dart';
import 'package:flutter/material.dart';

abstract class BasePlateVersion extends StatefulWidget {
  final PlateParts parts;
  final double size;
  final bool editable;
  final void Function(PlateParts parts)? onChanged;

  const BasePlateVersion({
    super.key,
    required this.parts,
    required this.size,
    required this.editable,
    this.onChanged,
  });

  double sized(double v) => v * size;
}
