import 'package:com_russia_game_flutter_ui/core/utils/adaptive_scale/scale_context_util.dart';
import 'package:flutter/material.dart';
import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';

abstract class AppSdpFonts {
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
      fontSize: sdp(context, fontSize),
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
      fontSize: sdp(context, fontSize),
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
      fontSize: sdpW(context, fontSize),
      color: color,
    );
  }

  /// Acrobat text style
  static TextStyle fontAkrobat180sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      180,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 180) / sdp(context, 180));
  }

  static TextStyle fontAkrobat124sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      124,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 124) / sdpW(context, 124));
  }

  static TextStyle fontAkrobat124sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      124,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 124) / sdp(context, 124));
  }

  static TextStyle fontAkrobat120sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      120,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 120) / sdpW(context, 120));
  }

  static TextStyle fontAkrobat120sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      120,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 120) / sdp(context, 120));
  }

  static TextStyle fontAkrobat100sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      100,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 100) / sdp(context, 100));
  }

  static TextStyle fontAkrobat100sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      100,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 100) / sdp(context, 100));
  }

  static TextStyle fontAkrobat94sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      94,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 94) / sdp(context, 90));
  }

  static TextStyle fontAkrobat94sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      94,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 94) / sdp(context, 90));
  }

  static TextStyle fontAkrobat90sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      90,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 90) / sdp(context, 86));
  }

  static TextStyle fontAkrobat90sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      90,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 90) / sdp(context, 86));
  }

  static TextStyle fontAkrobat84sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      84,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 74) / sdpW(context, 90));
  }

  static TextStyle fontAkrobat84sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      84,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 74) / sdp(context, 90));
  }

  static TextStyle fontAkrobat80sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      80,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 74) / sdpW(context, 90));
  }

  static TextStyle fontAkrobat80sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      80,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 74) / sdp(context, 90));
  }

  static TextStyle fontAkrobat76sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      76,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 90) / sdp(context, 90));
  }

  static TextStyle fontAkrobat76sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      76,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 90) / sdpW(context, 90));
  }

  static TextStyle fontAkrobat72sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      72,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 72) / sdp(context, 72));
  }

  static TextStyle fontAkrobat72sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      72,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 72) / sdpW(context, 72));
  }

  static TextStyle fontAkrobat70sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      70,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 70) / sdp(context, 70));
  }

  static TextStyle fontAkrobat70sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      72,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 70) / sdpW(context, 70));
  }

  static TextStyle fontAkrobat64sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      64,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 64) / sdp(context, 64));
  }

  static TextStyle fontAkrobat64sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      64,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 64) / sdpW(context, 64));
  }

  static TextStyle fontAkrobat62sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      62,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 62) / sdpW(context, 62));
  }

  static TextStyle fontAkrobat60sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      60,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 60) / sdp(context, 60));
  }

  static TextStyle fontAkrobat60sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      60,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 60) / sdp(context, 60));
  }

  static TextStyle fontAkrobat58sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      58,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 58) / sdpW(context, 58));
  }

  static TextStyle fontAkrobat56sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      56,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 56) / sdpW(context, 56));
  }

  static TextStyle fontAkrobat56sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      56,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 56) / sdp(context, 56));
  }

  static TextStyle fontAkrobat54sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      54,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 54) / sdpW(context, 54));
  }

  static TextStyle fontAkrobat52sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      52,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 52) / sdp(context, 52));
  }

  static TextStyle fontAkrobat52sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      52,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 52) / sdpW(context, 52));
  }

  static TextStyle fontAkrobat50sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      50,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 50) / sdp(context, 50));
  }

  static TextStyle fontAkrobat50sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      50,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 50) / sdp(context, 50));
  }

  static TextStyle fontAkrobat48sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      48,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 48) / sdp(context, 48));
  }

  static TextStyle fontAkrobat48sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      48,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 48) / sdpW(context, 48));
  }

  static TextStyle fontAkrobat46sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      46,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 46) / sdpW(context, 46));
  }

  static TextStyle fontAkrobat46sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      46,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 46) / sdp(context, 46));
  }

  static TextStyle fontAkrobat45sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      45,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 45) / sdp(context, 45));
  }

  static TextStyle fontAkrobat45sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      45,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 45) / sdpW(context, 45));
  }

  static TextStyle fontAkrobat44sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      44,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 44) / sdpW(context, 44));
  }

  static TextStyle fontAkrobat44sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      44,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 44) / sdp(context, 44));
  }

  static TextStyle fontAkrobat42sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      42,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 42) / sdpW(context, 42));
  }

  static TextStyle fontAkrobat42sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      42,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 42) / sdp(context, 42));
  }

  static TextStyle fontAkrobat40sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      40,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 40) / sdpW(context, 40));
  }

  static TextStyle fontAkrobat40sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      40,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 40) / sdp(context, 40));
  }

  static TextStyle fontAkrobat38sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      38,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 38) / sdpW(context, 38));
  }

  static TextStyle fontAkrobat38sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      38,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 38) / sdp(context, 38));
  }

  static TextStyle fontAkrobat36sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      36,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 36) / sdpW(context, 36));
  }

  static TextStyle fontAkrobat36sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      36,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 36) / sdp(context, 36));
  }

  static TextStyle fontAkrobat34sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      34,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 24) / sdp(context, 34));
  }

  static TextStyle fontAkrobat32sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      32,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 30) / sdpW(context, 32));
  }

  static TextStyle fontAkrobat32sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      32,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 30) / sdp(context, 32));
  }

  static TextStyle fontAkrobat30sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      30,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 30) / sdp(context, 32));
  }

  static TextStyle fontAkrobat30sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      30,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 30) / sdpW(context, 32));
  }

  static TextStyle fontAkrobat29sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      29,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 29) / sdp(context, 29));
  }

  static TextStyle fontAkrobat29sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      29,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 29) / sdpW(context, 29));
  }

  static TextStyle fontAkrobat28sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      28,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 28) / sdp(context, 28));
  }

  static TextStyle fontAkrobat28sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      28,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 28) / sdpW(context, 28));
  }

  static TextStyle fontAkrobat27sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      27,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 27) / sdpW(context, 27));
  }

  static TextStyle fontAkrobat26sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      26,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 26) / sdpW(context, 26));
  }

  static TextStyle fontAkrobat26sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      26,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 26) / sdp(context, 26));
  }

  static TextStyle fontAkrobat24sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      24,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 24) / sdpW(context, 24));
  }

  static TextStyle fontAkrobat24sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobat(
      context,
      24,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 24) / sdp(context, 24));
  }

  static TextStyle fontAkrobat22sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      22,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 22) / sdpW(context, 22));
  }

  static TextStyle fontAkrobat20sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseAkrobatW(
      context,
      20,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 20) / sdpW(context, 20));
  }

  /// Halvar text style
  static TextStyle fontHalvar180sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      180,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 180) / sdp(context, 180));
  }

  static TextStyle fontHalvar124sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      124,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 124) / sdpW(context, 124));
  }

  static TextStyle fontHalvar124sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      124,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 124) / sdp(context, 124));
  }

  static TextStyle fontHalvar120sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      120,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 120) / sdpW(context, 120));
  }

  static TextStyle fontHalvar120sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      120,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 120) / sdp(context, 120));
  }

  static TextStyle fontHalvar100sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      100,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 100) / sdp(context, 100));
  }

  static TextStyle fontHalvar100sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      100,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 100) / sdp(context, 100));
  }

  static TextStyle fontHalvar94sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      94,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 94) / sdp(context, 90));
  }

  static TextStyle fontHalvar94sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      94,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 94) / sdp(context, 90));
  }

  static TextStyle fontHalvar90sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      90,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 90) / sdp(context, 86));
  }

  static TextStyle fontHalvar90sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      90,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 90) / sdp(context, 86));
  }

  static TextStyle fontHalvar84sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      84,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 74) / sdpW(context, 90));
  }

  static TextStyle fontHalvar84sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      84,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 74) / sdp(context, 90));
  }

  static TextStyle fontHalvar80sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      80,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 74) / sdpW(context, 90));
  }

  static TextStyle fontHalvar80sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      80,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 74) / sdp(context, 90));
  }

  static TextStyle fontHalvar76sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      76,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 90) / sdp(context, 90));
  }

  static TextStyle fontHalvar76sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      76,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 90) / sdpW(context, 90));
  }

  static TextStyle fontHalvar72sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      72,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 72) / sdp(context, 72));
  }

  static TextStyle fontHalvar72sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      72,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 72) / sdpW(context, 72));
  }

  static TextStyle fontHalvar70sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      70,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 70) / sdp(context, 70));
  }

  static TextStyle fontHalvar70sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      72,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 70) / sdpW(context, 70));
  }

  static TextStyle fontHalvar64sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      64,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 64) / sdp(context, 64));
  }

  static TextStyle fontHalvar64sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      64,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 64) / sdpW(context, 64));
  }

  static TextStyle fontHalvar62sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      62,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 62) / sdpW(context, 62));
  }

  static TextStyle fontHalvar60sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      60,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 60) / sdp(context, 60));
  }

  static TextStyle fontHalvar60sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      60,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 60) / sdp(context, 60));
  }

  static TextStyle fontHalvar58sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      58,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 58) / sdpW(context, 58));
  }

  static TextStyle fontHalvar56sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      56,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 56) / sdpW(context, 56));
  }

  static TextStyle fontHalvar56sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      56,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 56) / sdp(context, 56));
  }

  static TextStyle fontHalvar54sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      54,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 54) / sdpW(context, 54));
  }

  static TextStyle fontHalvar52sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      52,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 52) / sdp(context, 52));
  }

  static TextStyle fontHalvar52sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      52,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 52) / sdpW(context, 52));
  }

  static TextStyle fontHalvar50sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      50,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 50) / sdp(context, 50));
  }

  static TextStyle fontHalvar50sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      50,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 50) / sdp(context, 50));
  }

  static TextStyle fontHalvar48sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      48,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 48) / sdp(context, 48));
  }

  static TextStyle fontHalvar48sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      48,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 48) / sdpW(context, 48));
  }

  static TextStyle fontHalvar46sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      46,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 46) / sdpW(context, 46));
  }

  static TextStyle fontHalvar46sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      46,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 46) / sdp(context, 46));
  }

  static TextStyle fontHalvar45sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      45,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 45) / sdp(context, 45));
  }

  static TextStyle fontHalvar45sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      45,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 45) / sdpW(context, 45));
  }

  static TextStyle fontHalvar44sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      44,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 44) / sdpW(context, 44));
  }

  static TextStyle fontHalvar44sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      44,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 44) / sdp(context, 44));
  }

  static TextStyle fontHalvar42sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      42,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 42) / sdpW(context, 42));
  }

  static TextStyle fontHalvar42sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      42,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 42) / sdp(context, 42));
  }

  static TextStyle fontHalvar40sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      40,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 40) / sdpW(context, 40));
  }

  static TextStyle fontHalvar40sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      40,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 40) / sdp(context, 40));
  }

  static TextStyle fontHalvar38sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      38,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 38) / sdpW(context, 38));
  }

  static TextStyle fontHalvar38sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      38,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 38) / sdp(context, 38));
  }

  static TextStyle fontHalvar36sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      36,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 36) / sdpW(context, 36));
  }

  static TextStyle fontHalvar36sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      36,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 36) / sdp(context, 36));
  }

  static TextStyle fontHalvar34sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      34,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 34) / sdp(context, 34));
  }

  static TextStyle fontHalvar32sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      32,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 30) / sdpW(context, 32));
  }

  static TextStyle fontHalvar32sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      32,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 30) / sdp(context, 32));
  }

  static TextStyle fontHalvar30sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      30,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 30) / sdp(context, 32));
  }

  static TextStyle fontHalvar30sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      30,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 30) / sdpW(context, 32));
  }

  static TextStyle fontHalvar29sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      29,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 29) / sdp(context, 29));
  }

  static TextStyle fontHalvar29sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      29,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 29) / sdpW(context, 29));
  }

  static TextStyle fontHalvar28sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      28,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 28) / sdp(context, 28));
  }

  static TextStyle fontHalvar28sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      28,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 28) / sdpW(context, 28));
  }

  static TextStyle fontHalvar27sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      27,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 27) / sdpW(context, 27));
  }

  static TextStyle fontHalvar26sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      26,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 26) / sdpW(context, 26));
  }

  static TextStyle fontHalvar26sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      26,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 26) / sdp(context, 26));
  }

  static TextStyle fontHalvar24sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      24,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 24) / sdpW(context, 24));
  }

  static TextStyle fontHalvar24sdp(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvar(
      context,
      24,
      color,
      fontWeight,
    ).copyWith(height: sdp(context, 24) / sdp(context, 24));
  }

  static TextStyle fontHalvar22sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      22,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 22) / sdpW(context, 22));
  }

  static TextStyle fontHalvar20sdpW(BuildContext context, Color color, FontWeight fontWeight) {
    return baseHalvarW(
      context,
      20,
      color,
      fontWeight,
    ).copyWith(height: sdpW(context, 20) / sdpW(context, 20));
  }
}
