import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';

class CustomHeightSizedBox extends StatelessWidget {
  final double height;
  const CustomHeightSizedBox(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaqueryHeight(height, context),
    );
  }
}

class CustomWidthSizedBox extends StatelessWidget {
  final double width;
  const CustomWidthSizedBox(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaqueryWidth(width, context),
    );
  }
}
