import 'package:com_russia_game_flutter_ui/core/di/locator.dart';

import 'adaptive_size.dart';

AdaptiveSize get adaptive => getIt<AdaptiveSize>();

bool get isPhone => adaptive.isPhone;

double w(double phoneSize, double tabletSize) =>
    adaptive.dp(phoneSize, tabletSize);

double h(double phoneSize, double tabletSize) =>
    adaptive.dpH(phoneSize, tabletSize);

extension AdaptiveNumExtension on num {
  double get w => adaptive.scaleW(toDouble());

  double get h => adaptive.scaleH(toDouble());
}
