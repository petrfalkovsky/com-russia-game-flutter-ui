import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/custom_animated_click.dart';

class CloseWidgetDeprecated extends StatelessWidget {
  final Function()? onTap;
  final bool isArrowBack;
  final bool secondStyle;
  final EdgeInsets? margin;
  final bool hasTitle;
  final bool inverted;
  final double? width;
  final double? height;

  const CloseWidgetDeprecated({
    super.key,
    this.onTap,
    this.isArrowBack = false,
    this.secondStyle = false,
    this.margin,
    this.hasTitle = false,
    this.inverted = false,
    this.width,
    this.height,
  });

  factory CloseWidgetDeprecated.hasTitleBack({
    Function()? onTap,
    bool inverted = false,
    double? width,
    double? height,
  }) => CloseWidgetDeprecated(
    onTap: onTap,
    isArrowBack: true,
    secondStyle: true,
    hasTitle: true,
    inverted: inverted,
    width: width,
    height: height,
  );

  @override
  Widget build(BuildContext context) {
    // Вычисляем размеры в зависимости от наличия пользовательских значений
    final buttonWidth = hasTitle ? width ?? 13.w : width ?? (secondStyle ? 28.0 : 36.0);
    final buttonHeight = hasTitle ? height ?? 10.h : height ?? (secondStyle ? 28.0 : 36.0);

    return TapAnimation(
      onTap: onTap,
      child: hasTitle
          ? Container(
              width: buttonWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                color: inverted
                    ? AppColors.black.withOpacity(0.05)
                    : AppColors.white.withOpacity(0.05),
                border: Border.all(
                  color: inverted
                      ? AppColors.black.withOpacity(0.3)
                      : AppColors.white.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: inverted
                          ? AppColors.black.withOpacity(0.4)
                          : AppColors.white.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      // Используем высоту кнопки для круглой части
                      width: buttonHeight,
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: inverted ? AppColors.black : AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: inverted ? const Color(0xff1a1a1a) : const Color(0xffe5e5e5),
                                width: 2,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: inverted ? AppColors.white : AppColors.black,
                            size: (buttonHeight / 2.5).clamp(15, 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      context.locales.back,
                      textAlign: TextAlign.center,
                      style:
                          AppFonts.fontAkrobat34sdp(
                            context,
                            inverted
                                ? AppColors.black.withOpacity(0.3)
                                : AppColors.white.withOpacity(0.3),
                            FontWeight.w700,
                          ).copyWith(
                            fontSize: height != null ? (buttonHeight / 3).clamp(12.0, 20.0) : 3.3.h,
                          ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: buttonWidth,
              height: buttonHeight,
              margin: margin,
              padding: secondStyle ? const EdgeInsets.all(1) : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: inverted ? AppColors.black : AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: inverted
                        ? const Color(0xff121212).withOpacity(0.25)
                        : const Color(0xffede5d8).withOpacity(0.25),
                    blurRadius: 35,
                    offset: const Offset(0, 0),
                  ),
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (secondStyle)
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: inverted ? const Color(0xff1a1a1a) : const Color(0xffe5e5e5),
                          width: 2,
                        ),
                      ),
                    ),
                  isArrowBack
                      ? Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: inverted ? AppColors.white : AppColors.black,
                          size: secondStyle
                              ? (buttonHeight * 0.6).clamp(12.0, 22.0)
                              : (buttonHeight * 0.7).clamp(15.0, 30.0),
                        )
                      : Icon(
                          Icons.close_rounded,
                          color: inverted ? AppColors.white : AppColors.black,
                          size: secondStyle
                              ? (buttonHeight * 0.6).clamp(12.0, 22.0)
                              : (buttonHeight * 0.7).clamp(15.0, 30.0),
                        ),
                ],
              ),
            ),
    );
  }
}
