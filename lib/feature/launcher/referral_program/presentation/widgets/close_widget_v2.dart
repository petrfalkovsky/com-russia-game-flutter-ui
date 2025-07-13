import 'package:com_russia_game_flutter_ui/core/shared_widgets/custom_animated_click.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/scale_context_util.dart';
import 'package:flutter/material.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/squirqle_gradient_border.dart';

class CloseWidgetV2 extends StatelessWidget {
  final Function()? onTap;
  const CloseWidgetV2({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapAnimation(
      onTap: onTap,
      child: SquirqleGradientBorder(
        width: scale(120),
        height: scale(120),
        cornerRadius: scale(30),
        cornerSmoothing: 1.0,
        borderWidth: scale(2),

        // бордеры
        isLinearBorderGradient: true,
        borderGradientBegin: Alignment.bottomLeft,
        borderGradientEnd: Alignment.topRight,
        borderGradientColors: [
          AppColors.white.withOpacity(.3),
          AppColors.white.withOpacity(.0),
          AppColors.white.withOpacity(.3),
        ],
        borderGradientStops: [0.0, 0.55, 1.0],

        // 2-й фон - белый с радиальным градиентом
        background2: BackgroundConfig(
          colors: [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.0)],
          isRadial: true,
          gradientCenter: Alignment.topLeft,
          gradientRadius: 3.0,
        ),

        child: Center(child: Image.asset(width: scale(50), AppWepb.refClose)),
      ),
    );
  }
}
