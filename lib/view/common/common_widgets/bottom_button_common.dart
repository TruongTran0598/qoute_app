import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/common_colors/app_colors.dart';
import 'package:qoute_app/view/common/common_text_style/text_style.dart';
import 'package:qoute_app/constant.dart';

class BottomButtonCommon extends StatefulWidget {
  final String nameButton;
  final void Function() onTap;

  const BottomButtonCommon({
    Key? key,
    required this.nameButton,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomButtonCommon> createState() => _BottomButtonCommonState();
}

class _BottomButtonCommonState extends State<BottomButtonCommon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(k20Size),
          topRight: Radius.circular(k20Size),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SafeArea(
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            margin: const EdgeInsets.all(k20Size),
            alignment: Alignment.center,
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(k20Size),
              color: AppColors.primaryColor,
            ),
            child: Text(
              widget.nameButton,
              style: AppTextStyle.nunito16WhiteBold,
            ),
          ),
        ),
      ),
    );
  }
}
