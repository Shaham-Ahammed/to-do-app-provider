import 'package:flutter/material.dart';

mediaqueryHeight(double height, BuildContext context) {
  return MediaQuery.of(context).size.height * height;
}

mediaqueryWidth(double width, BuildContext context) {
  return MediaQuery.of(context).size.width * width;
}
