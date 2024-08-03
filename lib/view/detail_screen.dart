import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_provider/model/todo_model.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/view_model/todo_view_model.dart';
import 'package:to_do_app_provider/widgets/details_screen_widgets/appbar.dart';
import 'package:to_do_app_provider/widgets/details_screen_widgets/completed_button.dart';
import 'package:to_do_app_provider/widgets/details_screen_widgets/details_container.dart';

class DetailScreen extends StatelessWidget {
  final TodoModel todoModel;
  final int index;
  const DetailScreen(this.todoModel, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: detailsScreenAppbar(context),
      body: Padding(
        padding: EdgeInsets.only(
            top: 12,
            bottom: mediaqueryHeight(0.04, context),
            left: 12,
            right: 12),
        child: SizedBox(
          height: mediaqueryHeight(1, context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              ToDoDetails(todoModel,index),
              Consumer<TodoViewModel>(
                builder: (context, value, child) {
                  if (!value.filteredTodoList[index].isCompleted) {
                    return CompletedButton(todoModel);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
