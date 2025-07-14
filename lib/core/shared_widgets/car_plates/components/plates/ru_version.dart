import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/styled_editing_controller.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_constants.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class RuVersion extends BasePlateVersion {
  const RuVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
  });

  @override
  State<RuVersion> createState() => _RuVersionState();
}

class _RuVersionState extends State<RuVersion> {
  late final TextEditingController controller;

  TextStyle ruLetterTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(17));

  TextStyle ruDigitTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(23));

  TextStyle ruRegionTextStyle(BuildContext context) => AppFonts.fontHalvar22(
    context,
    AppColors.black,
    FontWeight.w500,
  ).copyWith(fontSize: widget.sized(16));

  @override
  void initState() {
    controller = StyledEditingController(styleOverrider: getLetterStyle);
    controller.value = ruPatternFormatter.getInitalValue(widget.parts.number);
    controller.addListener(() {
      widget.onChanged?.call(widget.parts.copyWith(number: controller.text.replaceAll(' ', '')));
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RuVersion oldWidget) {
    controller.value = ruPatternFormatter.getInitalValue(widget.parts.number);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TextStyle? getLetterStyle(TextEditingValue value, int index) {
    if (index >= value.text.length) return null;
    if (int.tryParse(value.text.characters.elementAt(index)) != null) {
      return ruDigitTextStyle(context);
    }
    return ruLetterTextStyle(context);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(widget.sized(2), widget.sized(2), 0, widget.sized(1)),
              child: TextField(
                readOnly: !widget.editable,
                style: ruDigitTextStyle(context),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'A 123 BC',
                  isDense: true,
                  hintStyle: ruLetterTextStyle(context).copyWith(color: Colors.grey),
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                autocorrect: false,
                controller: controller,
                inputFormatters: [ruPatternFormatter],
              ),
            ),
          ),
          SizedBox(
            width: widget.sized(32),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: widget.sized(3), right: widget.sized(7)),
                child: Text(widget.parts.region, style: ruRegionTextStyle(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
