import 'package:flutter/material.dart';
import 'package:to_do_app_provider/model/todo_model.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/view/detail_screen.dart';

class ItemList extends StatelessWidget {
  final TodoModel todoModel;
  final int index;
  const ItemList(
    this.todoModel,this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      color: AppColors.listTileGreyColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  DetailScreen(todoModel,index),
          ));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: todoModel.isCompleted
                        ? AppColors.greenShadowColor
                        : AppColors.greyShadowColor,
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: 2)
              ],
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(90)),
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFont(todoModel.title.toUpperCase(),
                  size: 0.05,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
              todoModel.isCompleted
                  ? const Icon(
                      Icons.check,
                      color: AppColors.greenColor,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
