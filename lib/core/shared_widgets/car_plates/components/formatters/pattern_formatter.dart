import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatternFormatter extends TextInputFormatter {
  final String pattern;
  final Map<String, List<TextInputFormatter>> symbols;
  final bool trimStaticSymols;

  PatternFormatter({required this.pattern, required this.symbols, this.trimStaticSymols = false});

  TextEditingValue getInitalValue(String text) {
    return formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: text));
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (text.length > pattern.length) {
      text = text.substring(0, pattern.length);
    }

    Characters patternChars = pattern.characters;
    int patternCharIndex = 0;
    var sb = StringBuffer();

    inputLoop:
    for (var inputChar in text.characters) {
      String patternChar;

      do {
        if (patternCharIndex >= pattern.length) break inputLoop;

        patternChar = patternChars.elementAt(patternCharIndex);

        if (symbols.containsKey(patternChar)) break;

        sb.write(patternChar);
        patternCharIndex++;

        if (patternChar == inputChar) continue inputLoop;
      } while (true);

      var formatters = _getSymbolFormatters(patternChar);
      var formatted = _processSymbol(inputChar, formatters);
      if (formatted.isEmpty) continue;

      sb.write(formatted.substring(0, 1));
      patternCharIndex++;
    }

    var result = sb.toString();

    return TextEditingValue(
        text: result, selection: TextSelection.collapsed(offset: result.length));
  }

  String _processSymbol(String char, List<TextInputFormatter> formatters) {
    var oldValue = const TextEditingValue();
    var newValue = TextEditingValue(text: char);

    return formatters
        .fold(newValue, (value, fomatter) => fomatter.formatEditUpdate(oldValue, value))
        .text;
  }

  List<TextInputFormatter> _getSymbolFormatters(String symbol) => symbols[symbol]!;
}
