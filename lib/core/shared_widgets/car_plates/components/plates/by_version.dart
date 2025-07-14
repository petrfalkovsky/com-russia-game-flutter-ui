import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/styled_editing_controller.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_constants.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class ByVersion extends BasePlateVersion {
  const ByVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
  });

  @override
  State<ByVersion> createState() => _ByVersionState();
}

class _ByVersionState extends State<ByVersion> {
  late final StyledEditingController controller;

  TextStyle byDigitTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(20), letterSpacing: widget.sized(1.2));

  TextStyle byLetterTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(18), letterSpacing: widget.sized(1.2));

  @override
  void initState() {
    controller = StyledEditingController(styleOverrider: getLetterStyle);
    controller.value = byPatternFormatter.getInitalValue(
      '${widget.parts.number} ${widget.parts.serial}',
    );
    controller.addListener(() {
      var parts = controller.text.split(' ');
      widget.onChanged?.call(
        widget.parts.copyWith(number: parts.firstOrNull ?? '', serial: parts.lastOrNull ?? ''),
      );
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ByVersion oldWidget) {
    controller.value = byPatternFormatter.getInitalValue(widget.parts.number);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TextStyle? getLetterStyle(TextEditingValue value, int index) {
    if (index >= value.text.length) return null;
    var char = value.text.characters.elementAt(index);
    if (int.tryParse(char) == null) {
      return byLetterTextStyle(context);
    }
    return byDigitTextStyle(context);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          widget.sized(16),
          widget.sized(4),
          widget.sized(6),
          widget.sized(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                readOnly: !widget.editable,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '1234 AB',
                  hintStyle: byDigitTextStyle(context).copyWith(color: Colors.grey),
                ),
                autocorrect: false,
                textAlign: TextAlign.center,
                style: byDigitTextStyle(context),
                controller: controller,
                inputFormatters: [byPatternFormatter],
              ),
            ),
            Text('-${widget.parts.region}', style: byDigitTextStyle(context)),
          ],
        ),
      ),
    );
  }
}
