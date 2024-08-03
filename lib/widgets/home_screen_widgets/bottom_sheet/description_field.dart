import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/texts.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.trim().isEmpty) {
          return AppTexts.descriptionErrorText;
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
          color: AppColors.whiteColor,
          fontFamily: AppFonts.kodchasan,
          fontSize: mediaqueryWidth(0.04, context)),
      controller: descriptionController,
      cursorColor: AppColors.whiteColor,
      maxLines: 10,
      decoration: InputDecoration(
          hintText: AppTexts.descriptionHintText,
          hintStyle: TextStyle(
              color: AppColors.greyShadowColor,
              fontFamily: AppFonts.kodchasan,
              fontSize: mediaqueryWidth(0.04, context)),
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
