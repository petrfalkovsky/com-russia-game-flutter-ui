import 'package:flutter/services.dart';

class ReplaceMapFormatter extends TextInputFormatter {
  final Map<String, String> replacements;

  ReplaceMapFormatter(this.replacements);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    for (var replacements in replacements.entries) {
      text = text.replaceAll(replacements.key, replacements.value);
    }

    return newValue.copyWith(text: text);
  }
}
