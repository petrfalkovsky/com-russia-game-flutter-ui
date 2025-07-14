import 'package:flutter/material.dart';

typedef StyleOverrider = TextStyle? Function(TextEditingValue value, int index);
typedef TextOverrider = TextEditingValue Function(TextEditingValue value);

class StyledEditingController extends TextEditingController {
  final StyleOverrider styleOverrider;
  final TextOverrider? textOverrider;

  StyledEditingController({required this.styleOverrider, this.textOverrider});

  TextSpan buildTextSpanRaw(TextEditingValue input, {TextStyle? style}) {
    TextStyle lastStyle = const TextStyle();
    List<TextSpan> spans = [];
    var sb = StringBuffer();

    var newValue = textOverrider?.call(input) ?? input;

    int length = newValue.text.length;

    void flushBuffer() {
      if (sb.isEmpty) return;
      spans.add(TextSpan(text: sb.toString(), style: style?.merge(lastStyle) ?? lastStyle));
      sb.clear();
    }

    for (var i = 0; i < length; i++) {
      TextStyle currentStyle = styleOverrider(newValue, i) ?? const TextStyle();

      if (currentStyle.compareTo(lastStyle) != RenderComparison.identical) {
        flushBuffer();
      }
      sb.write(newValue.text[i]);
      lastStyle = currentStyle;
    }

    flushBuffer();

    return TextSpan(
      style: style,
      children: spans,
    );
  }

  @override
  TextSpan buildTextSpan(
      {required BuildContext context, TextStyle? style, required bool withComposing}) {
    return buildTextSpanRaw(value, style: style);
  }
}
