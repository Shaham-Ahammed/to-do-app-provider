import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/sizedboxes.dart';
import 'package:to_do_app_provider/utils/texts.dart';
import 'package:to_do_app_provider/view_model/todo_view_model.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/appbar.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/edit_and_delete_panel.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/floating_action_button.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/item_list.dart';
import 'package:to_do_app_provider/widgets/home_screen_widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: appbarHomeScreen(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            if (context.watch<TodoViewModel>().todoList.isNotEmpty)
              const SearchBox(),
            const CustomHeightSizedBox(0.03),
            Consumer<TodoViewModel>(
              builder: (context, value, child) {
                if (value.todoList.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: CustomFont(AppTexts.noTodosAdded, size: 0.03),
                    ),
                  );
                } else {
                  if (value.filteredTodoList.isEmpty) {
                    return const CustomFont(AppTexts.noMatchesFound, size: 0.03);
                  }
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final item = value.filteredTodoList[index];

                          return Padding(
                            padding: index != value.todoList.length - 1
                                ? const EdgeInsets.symmetric(horizontal: 8)
                                : EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    bottom: mediaqueryHeight(0.1, context)),
                            child: Slidable(
                              endActionPane:
                                  editAndDeleteOptions(item, context),
                              child: ItemList(item, index),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const CustomHeightSizedBox(0.032);
                        },
                        itemCount: value.filteredTodoList.length),
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: const HomeScreenFloatingActionButton(),
    );
  }
}
