import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/styled_editing_controller.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_constants.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class KzVersion extends BasePlateVersion {
  const KzVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
  });

  @override
  State<KzVersion> createState() => _KzVersionState();
}

class _KzVersionState extends State<KzVersion> {
  late final StyledEditingController controller;

  TextStyle kzLetterTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(17));

  TextStyle kzDigitTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(22));

  TextStyle kzRegionTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(22));

  @override
  void initState() {
    controller = StyledEditingController(styleOverrider: getLetterStyle);
    controller.value = kzPatternFormatter.getInitalValue(widget.parts.number);
    controller.addListener(() {
      widget.onChanged?.call(widget.parts.copyWith(number: controller.text));
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant KzVersion oldWidget) {
    controller.value = kzPatternFormatter.getInitalValue(widget.parts.number);
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
      return kzDigitTextStyle(context);
    }
    return kzLetterTextStyle(context);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.sized(4)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: widget.sized(19)),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: '123 ABC',
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: kzLetterTextStyle(context).copyWith(color: Colors.grey),
                    ),
                    readOnly: !widget.editable,
                    style: kzDigitTextStyle(context),
                    autocorrect: false,
                    controller: controller,
                    inputFormatters: [kzPatternFormatter],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widget.sized(32),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: widget.sized(4)),
                  child: Text(
                    widget.parts.region,
                    textAlign: TextAlign.center,
                    style: kzRegionTextStyle(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
