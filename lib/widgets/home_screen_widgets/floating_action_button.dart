import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/bottom_sheet.dart';


class HomeScreenFloatingActionButton extends StatelessWidget {
  const HomeScreenFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.greyShadowColor, width: 3),
          borderRadius: BorderRadius.circular(90)),
      onPressed: () {
        showBottomSheetForAdding(context);
      },
      child: const Icon(
        Icons.add,
        color: AppColors.listTileGreyColor,
      ),
    );
  }
}