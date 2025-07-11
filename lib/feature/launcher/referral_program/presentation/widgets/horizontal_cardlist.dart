import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_sdp_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
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
  final double containerHeight;
  final int invitedCount;

  const HorizontalCardsList({
    super.key,
    required this.cardSize,
    required this.cardSpacing,
    required this.itemCount,
    required this.ovalLevels,
    required this.containerHeight,
    required this.invitedCount,
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
  @override
  Widget build(BuildContext context) {
    _sdp(double value) => sdpW(context, value) * 1.08;

    return SizedBox(
      height: containerHeight,
      child: Stack(
        children: [
          // фон с градиентным бордером
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: containerHeight,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: _sdp(2), color: Colors.transparent),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.white.withOpacity(0.3), Colors.transparent],
                  stops: [0.0, 0.02],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(color: AppColors.refGrey2.withOpacity(0.85)),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 6,
                      colors: [Colors.white.withOpacity(.05), Colors.white.withOpacity(0.0)],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // текст слева
          Positioned(
            bottom: 0,
            left: _sdp(91),
            child: Container(
              height: containerHeight,
              width: _sdp(353),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locales.ref_you_invite,
                    style: AppSdpFonts.fontAkrobat50sdpW(context, AppColors.white, FontWeight.w700),
                  ),
                  _sdp(8).height,
                  Text(
                    '$invitedCount ${context.locales.ref_persons.toUpperCase()}',
                    style: AppSdpFonts.fontAkrobat70sdpW(
                      context,
                      AppColors.refYellowLight,
                      FontWeight.w800,
                    ).copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),

          // список
          Positioned(
            bottom: _sdp(29),
            left: _sdp(444),
            right: 0,
            child: ClipRect(
              child: SizedBox(
                height: cardSize,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.hardEdge, // обрезка
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
              ),
            ),
          ),
        ],
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
                cardBuilder?.call(index) ?? Container(),
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
                          style: AppSdpFonts.fontAkrobat40sdpW(
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
        if (showDone)
          Positioned(
            top: sdpW(context, 18),
            right: sdpW(context, 18),
            child: Center(child: Image.asset(AppWepb.refDone, width: sdpW(context, 40))),
          ),
      ],
    );
  }

  Widget _buildFirstOval(context) {
    final isActive = isOvalActive?.call(0) ?? false;
    final level = ovalLevels.isNotEmpty ? ovalLevels[0] : 1;

    return SizedBox(
      width: cardSpacing,
      child: Stack(
        alignment: Alignment.center,
        children: [
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
                  style: AppSdpFonts.fontAkrobat36sdpW(
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
          Positioned(
            child: Container(
              width: ovalWidth * 1.5,
              height: lineHeight,
              color: isActive ? AppColors.refYellowLight1 : AppColors.refGrey,
            ),
          ),
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
                  style: AppSdpFonts.fontAkrobat36sdpW(
                    context,
                    isActive ? AppColors.black : AppColors.white.withOpacity(.2),
                    FontWeight.w700,
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
