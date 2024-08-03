import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app_provider/utils/colors.dart';

ActionPane editAndDeleteOptions() {
  return ActionPane(
    motion: const BehindMotion(),
    children: [
      SlidableAction(
        onPressed: (context) {},
        backgroundColor: AppColors.blueColor,
        foregroundColor: AppColors.whiteColor,
        icon: Icons.edit,
        borderRadius: BorderRadius.circular(90),
      ),
      SlidableAction(
        onPressed: (context) {
        
        },
        backgroundColor: AppColors.redColor,
        foregroundColor: AppColors.whiteColor,
        icon: Icons.delete,
        borderRadius: BorderRadius.circular(90),
      ),
    ],
  );
}
