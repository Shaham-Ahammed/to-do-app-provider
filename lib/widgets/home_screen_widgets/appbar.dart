import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/texts.dart';


AppBar appbarHomeScreen() {
    return AppBar(
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      title: const CustomFont(AppTexts.title,
          fontFamily: AppFonts.atma, fontWeight: FontWeight.w600, size: 0.07),
    );
  }