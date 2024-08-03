import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/sizedboxes.dart';

alertDialogueConfirmation({required BuildContext context, required int index,required String heading, required Function()? function}) {
  showDialog(
    barrierColor: Colors.black87,
    context: context,
    builder: (ctx2) {
      return AlertDialog(
        backgroundColor: AppColors.blackColor,
        content: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.greyShadowColor, width: 3)),
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: mediaqueryHeight(0.05, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFont(
                  "confirm $heading",
                  size: 0.06,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
                const CustomHeightSizedBox(0.03),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaqueryWidth(0.05, context),
                            vertical: mediaqueryHeight(0.02, context)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: AppColors.greyShadowColor)),
                        child: const CustomFont("NO ", size: 0.04),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                       function;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaqueryWidth(0.05, context),
                            vertical: mediaqueryHeight(0.02, context)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: AppColors.greyShadowColor)),
                        child: const CustomFont("YES", size: 0.04),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        contentPadding: const EdgeInsets.all(0),

  
      );
    },
  );
}
