import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/pattern_formatter.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/replace_map_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String rusEnChars = "abekmhopctxy";
const String rusRusChars = "авекмнорстху";
const String otherEnChars = "abekmhopctix";
const String otherRusChars = "авекмнорстих";

final RegExp russiaAllowedChars = RegExp(r'[abekmhopctxy]', caseSensitive: false);
final RegExp otherAllowedChars = RegExp(r'[abekmhopctix]', caseSensitive: false);

// Форматтеры
final rusReplaceFormatter = ReplaceMapFormatter({
  for (var (index, enChar) in rusEnChars.characters.indexed) ...{
    rusRusChars[index]: enChar.toUpperCase(),
    rusRusChars[index].toUpperCase(): enChar.toUpperCase(),
    enChar: enChar.toUpperCase(),
  },
});

final otherReplaceFormatter = ReplaceMapFormatter({
  for (var (index, enChar) in otherEnChars.characters.indexed) ...{
    otherRusChars[index]: enChar.toUpperCase(),
    otherRusChars[index].toUpperCase(): enChar.toUpperCase(),
    enChar: enChar.toUpperCase(),
  },
});

final ruPatternFormatter = PatternFormatter(
  pattern: 'x 000 xx',
  symbols: {
    'x': [rusReplaceFormatter, FilteringTextInputFormatter.allow(russiaAllowedChars)],
    '0': [FilteringTextInputFormatter.digitsOnly],
  },
);

final kzPatternFormatter = PatternFormatter(
  pattern: '000xxx',
  symbols: {
    'x': [otherReplaceFormatter, FilteringTextInputFormatter.allow(otherAllowedChars)],
    '0': [FilteringTextInputFormatter.digitsOnly],
  },
);

final byPatternFormatter = PatternFormatter(
  pattern: '0000 xx',
  symbols: {
    'x': [otherReplaceFormatter, FilteringTextInputFormatter.allow(otherAllowedChars)],
    '0': [FilteringTextInputFormatter.digitsOnly],
  },
);

final uaPatternFormatter = PatternFormatter(
  pattern: '0000',
  symbols: {
    '0': [FilteringTextInputFormatter.digitsOnly],
  },
);
