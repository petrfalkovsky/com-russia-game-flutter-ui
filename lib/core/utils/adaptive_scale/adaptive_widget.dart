import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/scale_context_util.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:flutter/material.dart';

/// БАЗОВЫЙ ВИДЖЕТ ДЛЯ АДАПТИВНОСТИ
abstract class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    updateScaleContext(context);
    return buildAdaptive(context);
  }

  Widget buildAdaptive(BuildContext context);
}
