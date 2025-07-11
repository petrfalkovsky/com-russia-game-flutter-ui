import 'dart:math' as math;

import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/squirqle_gradient_border.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/widgets/close_widget_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkomatAppBar extends StatelessWidget {
  final TextStyle? textStyle;

  const ParkomatAppBar({super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Рассчитываем доступную ширину для поиска
        final availableWidth = constraints.maxWidth - scale(200); // Резерв для заголовка и кнопки
        final searchWidth = math.min(scale(480), math.max(scale(200), availableWidth));

        return Row(
          children: [
            /// ЗАГОЛОВОК
            Expanded(
              child: Text(
                context.locales.parking_get_car.toUpperCase(),
                style:
                    textStyle ?? AppFonts.fontHalvar80(context, AppColors.white, FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(width: scale(20)),

            /// ПОИСК И КНОПКА ЗАКРЫТЬ
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ПОИСК
                SizedBox(
                  width: searchWidth,
                  child: SquirqleGradientBorder(
                    width: searchWidth,
                    height: scale(120),
                    cornerRadius: scale(30),
                    cornerSmoothing: 1.0,
                    borderWidth: scale(2),

                    // границы
                    isLinearBorderGradient: true,
                    borderGradientBegin: Alignment.bottomLeft,
                    borderGradientEnd: Alignment.topRight,
                    borderGradientColors: [
                      AppColors.white.withOpacity(.1),
                      AppColors.white.withOpacity(.1),
                      AppColors.white.withOpacity(.0),
                    ],
                    borderGradientStops: [0.0, 0.35, 1.0],

                    // 1-й фон - черный с прозрачностью 0.7
                    background1: BackgroundConfig(
                      colors: [Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.7)],
                      isRadial: false,
                    ),

                    // 2-й фон - белый с радиальным градиентом
                    background2: BackgroundConfig(
                      colors: [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.0)],
                      isRadial: true,
                      gradientCenter: Alignment.topLeft,
                      gradientRadius: 3.0,
                    ),

                    child: Row(
                      children: [
                        SizedBox(width: scale(30)),

                        SvgPicture.asset(AppVectors.parkingSearch, width: scale(50)),

                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            decoration: InputDecoration(
                              hintText: context.locales.parking_search.toUpperCase(),
                              hintStyle: AppFonts.fontHalvar50(
                                context,
                                AppColors.white.withOpacity(.5),
                                FontWeight.w500,
                              ).copyWith(height: 2.8),

                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            cursorColor: Colors.white,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: scale(20)),

                /// ЗАКРЫТЬ КНОПКА
                CloseWidgetV2(onTap: () => Navigator.pop(context)),

                SizedBox(width: scale(90)),
              ],
            ),
          ],
        );
      },
    );
  }
}
