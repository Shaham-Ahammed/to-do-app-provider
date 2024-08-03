import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_provider/model/todo_model.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/sizedboxes.dart';
import 'package:to_do_app_provider/view_model/todo_view_model.dart';

class ToDoDetails extends StatelessWidget {
  final TodoModel todoModel;
  final int index;
  const ToDoDetails(
    this.todoModel,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.listTileGreyColor,
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.normal,
                color: value.filteredTodoList[index].isCompleted
                    ? AppColors.greenShadowColor
                    : AppColors.greyShadowColor,
                offset: const Offset(0, 0),
                blurRadius: 6,
                spreadRadius: 6)
          ],
        ),
        width: double.infinity,
        child: Column(
          children: [
            const CustomHeightSizedBox(0.02),
            Center(
              child: CustomFont(
                todoModel.title.toUpperCase(),
                size: 0.06,
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
            Padding(
              padding: const EdgeInsets.all(12),
              child: CustomFont(todoModel.description, size: 0.04),
            ),
          ],
        ),
      ),
    );
  }
}
