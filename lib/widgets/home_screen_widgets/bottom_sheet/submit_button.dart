import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_provider/model/todo_model.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/texts.dart';
import 'package:to_do_app_provider/view_model/todo_view_model.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key,
      required this.formKey,
      required this.titleController,
      required this.descriptionController,
      required this.todoModel});
  final TodoModel? todoModel;
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        borderRadius: BorderRadius.circular(90),
        color: AppColors.blackColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(90),
          onTap: () {
            if (formKey.currentState!.validate()) {
              todoModel == null
                  ? context.read<TodoViewModel>().addData(TodoModel(
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                      isCompleted: false))
                  : context.read<TodoViewModel>().editTodoItem(
                      todoModel!,
                      titleController.text.trim(),
                      descriptionController.text.trim());
              Navigator.pop(context);
            } else {
              return;
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.1, context), vertical: 10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(90),
                border: Border.all(color: AppColors.greyShadowColor)),
            child: CustomFont(
              todoModel == null ? AppTexts.addTask : AppTexts.editTask,
              size: 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}