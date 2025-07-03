import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_images.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

class BalanceWidget extends StatelessWidget {
  final Widget? child;
  final String coinIconPath;
  final String? balanceValue;
  final double? height;
  final double? cornerRadius;

  // cглаживание скруглений (0.0–1.0)
  final double? cornerSmoothing;
  final double? borderWidth;
  final double? innerBlurRadius;
  final double? outerBlurRadius;
  final double? iconSize;
  final double? addIconPaddingLeft;
  final double? addIconPaddingRight;
  final EdgeInsets? iconPadding;
  final EdgeInsets? textHorizontalPadding;
  final EdgeInsets? containerMargin;
  final List<Color>? borderGradientColors;
  final List<Color>? fillGradientColors;
  final List<Color>? fillGradientColorsRigth;
  final List<Color>? rightBorderGradientColors;

  final bool isGreyView;

  const BalanceWidget({
    super.key,
    this.child,
    this.coinIconPath = AppImages.refEdit,
    this.balanceValue,
    this.height,
    this.cornerRadius,
    this.cornerSmoothing,
    this.borderWidth,
    this.iconSize,
    this.iconPadding,
    this.textHorizontalPadding,
    this.containerMargin,
    this.borderGradientColors,
    this.fillGradientColors,
    this.fillGradientColorsRigth,
    this.rightBorderGradientColors,
    this.addIconPaddingLeft,
    this.addIconPaddingRight,
    this.innerBlurRadius,
    this.outerBlurRadius,
    this.isGreyView = false,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveHeight = height ?? 100;
    final double radius = cornerRadius ?? 30.0;
    final double smoothing = cornerSmoothing ?? 1.0;
    final double effectiveBorderWidth = borderWidth ?? 1.0;
    final double effectiveIconSize = iconSize ?? 40.0;
    final EdgeInsets effectivePadding = iconPadding ?? EdgeInsets.zero;

    final List<Color> fillColors =
        fillGradientColors ??
        const [
          Color.fromARGB(255, 55, 29, 24),
          AppColors.refYellowLight1,
          AppColors.refYellowDark2,
        ];

    final List<Color> rightBorderColors =
        rightBorderGradientColors ?? [Colors.red, Colors.red, Colors.red];

    return Stack(
      children: [
        if (isGreyView)
          Positioned(
            right: sdpW(context, 10),
            child: Container(
              width: height,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.35), blurRadius: 20, spreadRadius: 1),
                ],
              ),
            ),
          ),
        Container(
          height: effectiveHeight,
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(cornerRadius: radius, cornerSmoothing: smoothing),
            ),
            shadows: [
              BoxShadow(
                color: isGreyView
                    ? Colors.transparent
                    : Color.fromARGB(255, 112, 84, 45).withOpacity(.6),
                blurRadius: outerBlurRadius ?? sdpW(context, 60),
                spreadRadius: 0,
                offset: Offset(sdpW(context, -20), sdpW(context, 0)),
              ),
            ],
            gradient: LinearGradient(
              begin: isGreyView ? Alignment.topLeft : Alignment.centerLeft,
              end: isGreyView ? Alignment.bottomRight : Alignment.centerRight,
              colors: fillColors,
              stops: isGreyView ? [0.0, .2, 1.0] : [0.0, .8, 1.0],
            ),
          ),
          padding: effectivePadding,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // левая часть
                InnerShadow(
                  shadows: [
                    Shadow(
                      color: AppColors.black.withOpacity(0.5),
                      blurRadius: innerBlurRadius ?? sdpW(context, 50),
                    ),
                  ],
                  child: Container(
                    height: double.maxFinite,
                    margin: containerMargin,

                    decoration: ShapeDecoration(
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius.only(
                          topLeft: SmoothRadius(
                            cornerRadius: radius * 0.9,
                            cornerSmoothing: smoothing,
                          ),
                          bottomLeft: SmoothRadius(
                            cornerRadius: radius * 0.9,
                            cornerSmoothing: smoothing,
                          ),

                          topRight: SmoothRadius.zero,
                          bottomRight: SmoothRadius.zero,
                        ),
                      ),
                      gradient: isGreyView
                          ? LinearGradient(
                              stops: [0.0, 0.15, 0.92, 1.0],
                              colors: [
                                Color(0xFF35393B),
                                Color(0xFF14181A),
                                Color(0xFF14181A),
                                Color(0xFF35393B),
                              ],
                            )
                          : null,
                      color: isGreyView ? null : AppColors.refBrown2,
                    ),
                    padding: textHorizontalPadding,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          isGreyView ? AppImages.refMoney : AppImages.refCoins,
                          width: effectiveIconSize,
                        ),
                        sdpW(context, 14).width,

                        Text(
                          textAlign: TextAlign.center,
                          balanceValue ?? '0',
                          style: AppFonts.fontAkrobat50sdpW(
                            context,
                            AppColors.white,
                            FontWeight.w700,
                          ),
                        ),
                        sdpW(context, 16).width,
                        Text(
                          textAlign: TextAlign.center,
                          isGreyView ? context.locales.rub : context.locales.RC,
                          style: AppFonts.fontAkrobat50sdpW(
                            context,
                            isGreyView ? AppColors.refGreen : AppColors.refYellowLight,
                            FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // правая часть
                _buildRightContainer(
                  context,
                  effectiveHeight,
                  radius,
                  smoothing,
                  effectiveBorderWidth,
                  effectiveIconSize,
                  rightBorderColors,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// правый контейнер
  Widget _buildRightContainer(
    BuildContext context,
    double effectiveHeight,
    double radius,
    double smoothing,
    double effectiveBorderWidth,
    double effectiveIconSize,
    List<Color> rightBorderColors,
  ) {
    final Widget contentWidget =
        child ??
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: addIconPaddingLeft ?? sdpW(context, 37),
              right: addIconPaddingRight ?? sdpW(context, 37 + 3),
            ),
            child: Image.asset(
              AppImages.refAdd,
              width: effectiveIconSize * 0.666,
              color: isGreyView ? AppColors.white.withOpacity(.5) : AppColors.black,
            ),
          ),
        );

    if (!isGreyView) {
      return SizedBox(height: double.maxFinite, child: contentWidget);
    }

    return Padding(
      padding: EdgeInsets.all(sdpW(context, isGreyView ? 2 : 0)),
      child: CustomPaint(
        painter: _GradientBorderPainter(
          borderColors: rightBorderColors,
          borderRadius: SmoothBorderRadius.only(
            topLeft: SmoothRadius.zero,
            bottomLeft: SmoothRadius.zero,
            topRight: SmoothRadius(cornerRadius: radius, cornerSmoothing: smoothing),
            bottomRight: SmoothRadius(cornerRadius: radius, cornerSmoothing: smoothing),
          ),
          borderWidth: effectiveBorderWidth,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: SmoothBorderRadius.only(
              topLeft: SmoothRadius.zero,
              bottomLeft: SmoothRadius.zero,
              topRight: SmoothRadius(cornerRadius: radius, cornerSmoothing: smoothing),
              bottomRight: SmoothRadius(cornerRadius: radius, cornerSmoothing: smoothing),
            ),
            gradient: RadialGradient(
              radius: .8,
              colors: [Color.fromARGB(255, 98, 102, 105), Color(0xFF35393B)],
            ),
          ),

          height: double.maxFinite,
          padding: EdgeInsets.all(effectiveBorderWidth),
          child: contentWidget,
        ),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final List<Color> borderColors;
  final SmoothBorderRadius borderRadius;
  final double borderWidth;

  _GradientBorderPainter({
    required this.borderColors,
    required this.borderRadius,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (borderWidth <= 0) return; // Не рисуем, если толщина границы 0 или меньше

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Создаем градиент для границы
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: borderColors,
      stops: [0.0, 0.5, 1.0],
    );

    // Создаем paint с градиентом
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Создаем путь для сглаженного прямоугольника
    final path = _createSmoothRectanglePath(rect, borderRadius);

    // Рисуем только границу
    canvas.drawPath(path, paint);
  }

  /// Создает путь для сглаженного прямоугольника
  Path _createSmoothRectanglePath(Rect rect, SmoothBorderRadius borderRadius) {
    final path = Path();

    // Для простоты используем обычные скругления
    // В реальном проекте здесь должна быть логика для SmoothBorderRadius
    final rRect = RRect.fromRectAndCorners(
      rect,
      topLeft: Radius.circular(borderRadius.topLeft.cornerRadius),
      topRight: Radius.circular(borderRadius.topRight.cornerRadius),
      bottomLeft: Radius.circular(borderRadius.bottomLeft.cornerRadius),
      bottomRight: Radius.circular(borderRadius.bottomRight.cornerRadius),
    );

    path.addRRect(rRect);
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
