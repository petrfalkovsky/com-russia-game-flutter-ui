import 'package:flutter/material.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_sdp_fonts.dart';

class EllipsisTextUtil extends StatelessWidget {
  final String text;
  final double? fontSize;
  final int countChars;
  final TextStyle? textStyle;

  const EllipsisTextUtil({
    super.key,
    required this.text,
    this.fontSize,
    required this.countChars,
    this.textStyle,
  });

  String formatText() {
    if (text.length > countChars) {
      return '${text.substring(0, countChars)}..';
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedText = formatText();

    return AutoSizeText(
      formattedText,
      style: textStyle ??
          AppSdpFonts.fontAkrobat34sdp(
            context,
            AppColors.black,
            FontWeight.w700,
          ).copyWith(
            fontSize: fontSize,
          ),
      minFontSize: 12,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
