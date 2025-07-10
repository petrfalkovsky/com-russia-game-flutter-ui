import 'package:flutter/material.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';

abstract class AppFonts {
  static const fontAkrobat = 'Akrobat';
  static const fontHalvar = 'Halvar';

  /// Base text styles
  static TextStyle baseAkrobat(
    BuildContext context,
    double fontSize,
    Color color,
    FontWeight fontWeight,
  ) {
    String fontName = fontAkrobat;

    return TextStyle(
      fontFamily: fontName,
      fontWeight: fontWeight,
      fontSize: scale(fontSize),
      color: color,
    );
  }

  static TextStyle baseAkrobatW(
    BuildContext context,
    double fontSize,
    Color color,
    FontWeight fontWeight,
  ) {
    String fontName = fontAkrobat;

    return TextStyle(
      fontFamily: fontName,
      fontWeight: fontWeight,
      // fontSize: scale( fontSize),
      fontSize: scale(fontSize),
      color: color,
    );
  }

  /// Base text styles
  static TextStyle baseHalvar(
    BuildContext context,
    double fontSize,
    Color color,
    FontWeight fontWeight,
  ) {
    String fontName = fontHalvar;

    return TextStyle(
      fontFamily: fontName,
      fontWeight: fontWeight,
      fontSize: scale(fontSize),
      color: color,
    );
  }

  static TextStyle baseHalvarW(
    BuildContext context,
    double fontSize,
    Color color,
    FontWeight fontWeight,
  ) {
    String fontName = fontHalvar;

    return TextStyle(
      fontFamily: fontName,
      fontWeight: fontWeight,
      fontSize: scale(fontSize),
      color: color,
    );
  }

  /// Acrobat text style
  static TextStyle fontAkrobat180(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 180, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat124(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 124, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat120(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 120, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat100(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 100, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat94(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 94, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat90(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 90, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat84(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 84, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat80(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 80, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat76(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 76, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat72(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 72, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat70(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 70, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat64(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 64, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat62(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 62, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat60(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 60, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat58(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 58, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat56(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 56, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat54(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 54, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat52(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 52, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat50(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 50, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat48(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 48, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat46(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 46, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat45(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 45, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat44(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 44, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat42(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 42, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat40(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 40, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat39(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 39, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat38(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 38, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat37(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 37, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat36(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 36, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat35(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 35, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat34(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 34, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat33(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 33, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat32(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 32, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat31(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 31, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat30(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 30, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat29(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 29, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat28(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(context, 28, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat27(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 27, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat26(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 26, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat25(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 25, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat24(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 24, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat23(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 23, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat22(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 22, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat21(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 21, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontAkrobat20(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(context, 20, color, fontWeight).copyWith(height: 1);
  }

  /// Halvar text style
  static TextStyle fontHalvar180(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 180, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar124(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 124, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar120(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 120, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar100(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 100, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar94(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 94, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar90(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 90, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar84(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 84, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar80(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 80, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar76(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 76, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar72(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 72, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar70(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 70, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar64(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 64, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar62(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 62, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar60(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 60, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar58(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 58, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar56(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 56, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar54(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 54, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar52(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 52, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar50(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 50, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar48(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 48, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar46(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 46, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar45(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 45, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar44(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 44, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar42(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 42, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar40(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 40, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar38(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 38, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar36(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 36, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar35(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 35, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar34(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 34, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar32(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 32, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar30(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 30, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar29(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 29, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar28(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(context, 28, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar27(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 27, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar26(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 26, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar24(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 24, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar22(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 22, color, fontWeight).copyWith(height: 1);
  }

  static TextStyle fontHalvar20(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(context, 20, color, fontWeight).copyWith(height: 1);
  }
}
