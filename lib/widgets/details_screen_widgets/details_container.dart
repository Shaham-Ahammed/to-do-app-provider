import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/sizedboxes.dart';


class ToDoDetails extends StatelessWidget {
  const ToDoDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.listTileGreyColor,
        boxShadow: const [
          BoxShadow(
              blurStyle: BlurStyle.normal,
              color: AppColors.greyShadowColor,
              offset: Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 6)
        ],
      ),
      width: double.infinity,
      child: Column(
        children: [
          const CustomHeightSizedBox(0.02),
          const Center(
            child: CustomFont(
              "TASK 1",
              size: 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomHeightSizedBox(0.02),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.whiteColor,
          ),
          const CustomHeightSizedBox(0.01),
          const Padding(
            padding: EdgeInsets.all(12),
            child: CustomFont(
                "asdfasfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfa",
                size: 0.04),
          ),
        ],
      ),
    );
  }
}
