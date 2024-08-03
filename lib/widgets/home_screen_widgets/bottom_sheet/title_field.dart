import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/texts.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return AppTexts.titleErrorText;
        } else {
          return null;
        }
      },
      style: TextStyle(
          color: AppColors.whiteColor,
          fontFamily: AppFonts.kodchasan,
          fontSize: mediaqueryWidth(0.04, context)),
      controller: titleController,
      maxLength: 20,
      cursorColor: AppColors.whiteColor,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              color: AppColors.greyShadowColor,
              fontFamily: AppFonts.kodchasan,
              fontSize: mediaqueryWidth(0.04, context)),
          hintText: AppTexts.titleHintText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.greyShadowColor),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
