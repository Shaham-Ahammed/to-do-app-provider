import 'package:flutter/material.dart';
import 'package:to_do_app_provider/model/todo_model.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/sizedboxes.dart';
import 'package:to_do_app_provider/utils/texts.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/bottom_sheet/description_field.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/bottom_sheet/submit_button.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/bottom_sheet/title_field.dart';

void homeScreenBottomSheet(BuildContext context, {TodoModel? todoModel}) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  if (todoModel != null) {
    titleController.text = todoModel.title;
    descriptionController.text = todoModel.description;
  }

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: AppColors.blackColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (context) {
      return Form(
        key: formKey,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            border: Border(
              top: BorderSide(
                color: AppColors.greyShadowColor,
                width: 2.0,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CustomFont(AppTexts.titleText, size: 0.045),
                  const CustomHeightSizedBox(0.02),
                  TitleField(titleController: titleController),
                  const CustomFont(AppTexts.description, size: 0.045),
                  const CustomHeightSizedBox(0.02),
                  DescriptionField(
                      descriptionController: descriptionController),
                  const CustomHeightSizedBox(0.02),
                  SubmitButton(
                    formKey: formKey,
                    titleController: titleController,
                    descriptionController: descriptionController,
                    todoModel: todoModel,
                  ),
                  const CustomHeightSizedBox(0.02),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
