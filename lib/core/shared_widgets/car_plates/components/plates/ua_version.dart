import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/styled_editing_controller.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_constants.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class UaVersion extends BasePlateVersion {
  const UaVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
  });

  @override
  State<UaVersion> createState() => _UaVersionState();
}

class _UaVersionState extends State<UaVersion> {
  late final StyledEditingController controller;

  TextStyle uaLetterTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(18));

  TextStyle uaDigitTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(20));

  @override
  void initState() {
    controller = StyledEditingController(styleOverrider: (_, __) => uaDigitTextStyle(context));
    controller.value = uaPatternFormatter.getInitalValue(widget.parts.number);
    controller.addListener(() {
      widget.onChanged?.call(widget.parts.copyWith(number: controller.text));
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UaVersion oldWidget) {
    controller.value = uaPatternFormatter.getInitalValue(widget.parts.number);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.sized(16),
          bottom: widget.sized(5),
          right: widget.sized(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(widget.parts.region, style: uaLetterTextStyle(context)),
            Expanded(
              child: TextField(
                readOnly: !widget.editable,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: widget.sized(-1.2)),
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '1234',
                  hintStyle: uaDigitTextStyle(context).copyWith(color: Colors.grey),
                ),
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.center,
                style: uaDigitTextStyle(context),
                autocorrect: false,
                controller: controller,
                inputFormatters: [uaPatternFormatter],
                maxLines: 1,
              ),
            ),
            Text(widget.parts.serial, style: uaLetterTextStyle(context)),
          ],
        ),
      ),
    );
  }
}
