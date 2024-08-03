import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_provider/model/todo_model.dart';
import 'package:to_do_app_provider/utils/alert_dialogue.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/texts.dart';
import 'package:to_do_app_provider/view_model/todo_view_model.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/bottom_sheet.dart';

ActionPane editAndDeleteOptions(TodoModel todoModel, BuildContext context) {
  return ActionPane(
    motion: const BehindMotion(),
    children: [
      SlidableAction(
        onPressed: (context3) {
          homeScreenBottomSheet(context, todoModel: todoModel);
        },
        backgroundColor: AppColors.blueColor,
        foregroundColor: AppColors.whiteColor,
        icon: Icons.edit,
        borderRadius: BorderRadius.circular(90),
      ),
      SlidableAction(
        onPressed: (context2) {
          alertDialogueConfirmation(
              context: context,
              todoModel: todoModel,
              heading: AppTexts.deletion,
              function: () {
                context.read<TodoViewModel>().deletingAtoDoItem(todoModel);
                Navigator.pop(context);
              });
        },
        backgroundColor: AppColors.redColor,
        foregroundColor: AppColors.whiteColor,
        icon: Icons.delete,
        borderRadius: BorderRadius.circular(90),
      ),
    ],
  );
}
