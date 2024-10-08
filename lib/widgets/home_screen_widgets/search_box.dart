import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/texts.dart';
import 'package:to_do_app_provider/view_model/todo_view_model.dart';


class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.greyShadowColor)),
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
              onChanged: (value) {
                context.read<TodoViewModel>().search(value);
              },
            style: TextStyle(
                color: AppColors.whiteColor,
                fontFamily: AppFonts.kodchasan,
                fontSize: mediaqueryWidth(0.04, context)),
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: mediaqueryWidth(0.05, context)),
                hintStyle: TextStyle(
                    color: AppColors.greyShadowColor,
                    fontFamily: AppFonts.kodchasan,
                    fontSize: mediaqueryWidth(0.04, context)),
                hintText: AppTexts.search,
                border: InputBorder.none),
          )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.whiteColor,
              ))
        ],
      ),
    );
  }
}
