import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/widgets/details_screen_widgets/appbar.dart';
import 'package:to_do_app_provider/widgets/details_screen_widgets/completed_button.dart';
import 'package:to_do_app_provider/widgets/details_screen_widgets/details_container.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              ToDoDetails(),
              CompletedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
