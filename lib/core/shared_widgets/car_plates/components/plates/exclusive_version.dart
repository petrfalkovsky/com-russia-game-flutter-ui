import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class ExclusiveVersion extends BasePlateVersion {
  const ExclusiveVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
  });

  @override
  State<ExclusiveVersion> createState() => _ExclusiveVersionState();
}

class _ExclusiveVersionState extends State<ExclusiveVersion> {
  late final TextEditingController controller;

  TextStyle customTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w500,
  ).copyWith(fontSize: widget.sized(20));

  @override
  void initState() {
    controller = TextEditingController();
    controller.value = TextEditingValue(text: widget.parts.number);
    controller.addListener(() {
      widget.onChanged?.call(widget.parts.copyWith(number: controller.text));
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExclusiveVersion oldWidget) {
    controller.value = TextEditingValue(text: widget.parts.number);
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
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: widget.sized(4)),
          child: TextField(
            readOnly: !widget.editable,
            decoration: const InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.zero,
              isDense: true,
              border: InputBorder.none,
            ),
            autocorrect: false,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.center,
            style: customTextStyle(context),
            controller: controller,
            maxLength: 7,
          ),
        ),
      ),
    );
  }
}
