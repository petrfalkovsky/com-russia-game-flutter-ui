import 'package:com_russia_game_flutter_ui/generated/l10n.dart';
import 'package:flutter/material.dart';


extension ContextExtensions on BuildContext {

  /// быстрый доступ к локализациям: context.locales
  S get locales => S.of(this);
}
