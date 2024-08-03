import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';

AppBar detailsScreenAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.blackColor,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_sharp,
          color: AppColors.whiteColor,
        )),
  );
}
