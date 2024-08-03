import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/sizedboxes.dart';
import 'package:to_do_app_provider/utils/texts.dart';

void showBottomSheetForAdding(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: AppColors.blackColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          border: Border(
            top: BorderSide(
              color: AppColors.greyShadowColor,
              width: 2.0,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CustomFont(AppTexts.titleText, size: 0.045),
                const CustomHeightSizedBox(0.02),
                TextFormField(
                  maxLength: 20,
                  cursorColor: AppColors.whiteColor,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.greyShadowColor),
                          borderRadius: BorderRadius.circular(12))),
                ),
                //   CustomHeightSizedBox(0.02),
                const CustomFont(AppTexts.description, size: 0.045),
                const CustomHeightSizedBox(0.02),
                TextFormField(
                  cursorColor: AppColors.whiteColor,
                  maxLines: 10,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.greyShadowColor),
                          borderRadius: BorderRadius.circular(12))),
                ),
                const CustomHeightSizedBox(0.02),
                Align(
                  alignment: Alignment.center,
                  child: Material(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColors.blackColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(90),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaqueryWidth(0.1, context),
                            vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(90),
                            border:
                                Border.all(color: AppColors.greyShadowColor)),
                        child: const CustomFont(
                          "add task",
                          size: 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const CustomHeightSizedBox(0.02),
              ],
            ),
          ),
        ),
      );
    },
  );
}
