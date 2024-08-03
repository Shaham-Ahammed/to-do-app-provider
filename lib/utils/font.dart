import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';

class CustomFont extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final FontWeight? fontWeight;
  final String fontFamily;
  final TextOverflow? overflow;

  const CustomFont(this.text,
      { this.color = AppColors.whiteColor,
      required this.size,
 this.overflow,
      this.fontFamily = AppFonts.kodchasan,
      this.fontWeight = FontWeight.normal,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: overflow,
          color: color,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: mediaqueryWidth(size, context)),
    );
  }
}

class AppFonts {
  static const String atma = "Atma";
  static const String kodchasan = "Kodchasan";
}
