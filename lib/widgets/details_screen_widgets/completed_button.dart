import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/sizedboxes.dart';
import 'package:to_do_app_provider/utils/texts.dart';
import 'package:to_do_app_provider/utils/alert_dialogue.dart';


class CompletedButton extends StatelessWidget {
  const CompletedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      color: AppColors.blackColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: () {
          alertDialogueConfirmation(context: context,index: 2, heading: "completed", function: () {  });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: mediaqueryWidth(0.1, context),
              vertical: 10),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(90),
              border: Border.all(color: AppColors.greyShadowColor)),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomFont(
                AppTexts.completed,
                size: 0.05,
                fontWeight: FontWeight.w500,
              ),
              CustomWidthSizedBox(0.03),
              Icon(
                Icons.check,
                color: AppColors.greenColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
