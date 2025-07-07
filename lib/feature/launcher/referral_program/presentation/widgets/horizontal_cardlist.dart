import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_images.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class HorizontalCardsList extends StatelessWidget {
  final double cardSize;
  final double cardSpacing;
  final double lineHeight;
  final double ovalWidth;
  final double ovalHeight;
  final double borderRadius;
  final Color lineColor;
  final List<Color> cardBorderGradient;
  final double borderWidth;
  final int itemCount;
  final Widget Function(int index)? cardBuilder;
  final double buttonHeight;
  final String buttonText;
  final bool Function(int index)? isClaimVisible;
  final bool Function(int index)? isDoneVisible;
  final bool Function(int index)? isOvalActive;
  final List<int> ovalLevels;

  const HorizontalCardsList({
    super.key,
    required this.cardSize,
    required this.cardSpacing,
    required this.itemCount,
    required this.ovalLevels,
    this.lineHeight = 2.0,
    this.ovalWidth = 60.0,
    this.ovalHeight = 20.0,
    this.borderRadius = 20,
    this.lineColor = Colors.grey,
    this.cardBorderGradient = const [Colors.white, Colors.white30],
    this.borderWidth = 1.0,
    this.cardBuilder,
    this.buttonHeight = 66.0,
    this.buttonText = 'нет',
    this.isClaimVisible,
    this.isDoneVisible,
    this.isOvalActive,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardSize,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          children: [
            // первый овал слева от всех карточек
            _buildFirstOval(context),

            // карточки и овалы между ними
            ...List.generate(itemCount * 2 - 1, (index) {
              if (index.isEven) {
                // карточка
                final cardIndex = index ~/ 2;
                return _buildCard(context, cardIndex);
              } else {
                // овал между карточками
                final ovalIndex = (index ~/ 2) + 1;
                return _buildOvalWithLine(context, ovalIndex);
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(context, int index) {
    final showClaim = isClaimVisible?.call(index) ?? false;
    final showDone = isDoneVisible?.call(index) ?? false;

    return Stack(
      children: [
        Container(
          width: cardSize,
          height: cardSize,
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.all(
                SmoothRadius(cornerRadius: borderRadius, cornerSmoothing: 1),
              ),
            ),

            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.0,
              colors: [
                AppColors.white.withOpacity(.9),
                AppColors.white.withOpacity(.05),
                AppColors.white.withOpacity(.0),
              ],
              stops: [0.0, 0.6, 1.0],
            ),
            shadows: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.01),
                blurRadius: sdpW(context, 40),
                spreadRadius: sdpW(context, 1),
                offset: Offset(0, 0),
              ),
              BoxShadow(
                color: AppColors.white.withOpacity(0.01),
                blurRadius: sdpW(context, 60),
                spreadRadius: sdpW(context, 20),
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.all(borderWidth),
            decoration: ShapeDecoration(
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: borderRadius, cornerSmoothing: 1),
                ),
              ),
              color: AppColors.refGrey2.withOpacity(.99),
            ),
            child: Stack(
              children: [
                // типа контент карточки можно вставить
                cardBuilder?.call(index) ?? Container(),

                // плашка получить
                if (showClaim)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: buttonHeight,
                      decoration: ShapeDecoration(
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius.only(
                            topLeft: SmoothRadius.zero,
                            bottomLeft: SmoothRadius(
                              cornerRadius: borderRadius,
                              cornerSmoothing: 1,
                            ),
                            topRight: SmoothRadius.zero,
                            bottomRight: SmoothRadius(
                              cornerRadius: borderRadius,
                              cornerSmoothing: 1,
                            ),
                          ),
                        ),
                        gradient: LinearGradient(
                          stops: [0.0, 1.0],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [AppColors.refGreenLight1, AppColors.refGreenDark2],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          buttonText.toUpperCase(),
                          style: AppFonts.fontHalvar40sdpW(
                            context,
                            AppColors.black,
                            FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        // ИКОНКА DONE
        if (showDone)
          Positioned(
            top: sdpW(context, 18),
            right: sdpW(context, 18),
            child: Center(child: Image.asset(AppImages.refDone, width: sdpW(context, 40))),
          ),
      ],
    );
  }

  // первый овал слева с линией, смещенной вправо
  Widget _buildFirstOval(context) {
    final isActive = isOvalActive?.call(0) ?? false;
    final level = ovalLevels.isNotEmpty ? ovalLevels[0] : 1;

    return SizedBox(
      width: cardSpacing,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // линия под овалом, смещенная вправо
          Positioned(
            child: Transform.translate(
              offset: Offset(ovalWidth * 0.25, 0),
              child: Container(
                width: ovalWidth * 1.5,
                height: lineHeight,
                color: isActive ? AppColors.refYellowLight1 : AppColors.refGrey,
              ),
            ),
          ),

          // овальный контейнер поверх линии
          Container(
            width: ovalWidth,
            height: ovalHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ovalHeight / 2),
              color: isActive ? AppColors.refYellowLight : AppColors.refGrey,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: sdpW(context, 3)),
                child: Text(
                  level.toString(),
                  style: AppFonts.fontAkrobat36sdpW(
                    context,
                    isActive ? AppColors.black : AppColors.white.withOpacity(.2),
                    FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOvalWithLine(context, int index) {
    final isActive = isOvalActive?.call(index) ?? false;
    final level = index < ovalLevels.length ? ovalLevels[index] : index + 1;

    return SizedBox(
      width: cardSpacing,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // линия под овалом
          Positioned(
            child: Container(
              width: ovalWidth * 1.5,
              height: lineHeight,
              color: isActive ? AppColors.refYellowLight1 : AppColors.refGrey,
            ),
          ),

          // овальный контейнер поверх линии
          Container(
            width: ovalWidth,
            height: ovalHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ovalHeight / 2),
              color: isActive ? AppColors.refYellowLight : AppColors.refGrey,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: sdpW(context, 3)),
                child: Text(
                  level.toString(),
                  style: AppFonts.fontAkrobat36sdpW(
                    context,
                    isActive ? AppColors.black : AppColors.white.withOpacity(.2),
                    FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
