import 'package:flutter/material.dart';
import 'package:qoute_app/common/common_colors/app_colors.dart';
import 'package:qoute_app/common/common_text_style/text_style.dart';
import 'package:qoute_app/constant.dart';

class InputFieldCommon extends StatefulWidget {
  final TextEditingController ctrlInputField;
  final String nameField;
  final bool isFirstField;
  final bool isHasPoint;
  final bool isMultiline;

  const InputFieldCommon({
    Key? key,
    required this.ctrlInputField,
    required this.nameField,
    this.isFirstField = false,
    this.isHasPoint = false,
    this.isMultiline = false,
  }) : super(key: key);

  @override
  State<InputFieldCommon> createState() => _InputFieldCommonState();
}

class _InputFieldCommonState extends State<InputFieldCommon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.isFirstField ? 0 : k16Size),
        Row(
          children: [
            widget.isHasPoint
                ? const Icon(
                    Icons.circle_outlined,
                    color: AppColors.primaryColor,
                    size: k08Size,
                  )
                : const SizedBox(),
            widget.isHasPoint
                ? const SizedBox(width: k12Size)
                : const SizedBox(),
            Expanded(
              child: TextField(
                controller: widget.ctrlInputField,
                cursorWidth: 1,
                cursorColor: Colors.black,
                cursorHeight: k24Size,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.nameField,
                  hintStyle: AppTextStyle.nunito20,
                ),
                style: AppTextStyle.nunito20,
                maxLines: widget.isMultiline ? null : 1,
                keyboardType: widget.isMultiline
                    ? TextInputType.multiline
                    : TextInputType.none,
              ),
            ),
          ],
        ),
        const Divider(color: AppColors.primaryColor),
      ],
    );
  }
}
