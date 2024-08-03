import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/mediaquery.dart';
import 'package:to_do_app_provider/utils/sizedboxes.dart';
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
            const SearchBox(),
            const CustomHeightSizedBox(0.03),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index != 9
                          ? const EdgeInsets.symmetric(horizontal: 8)
                          : EdgeInsets.only(
                              left: 8,
                              right: 8,
                              bottom: mediaqueryHeight(0.1, context)),
                      child: Slidable(
                        endActionPane: editAndDeleteOptions(),
                        child: ItemList(index),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const CustomHeightSizedBox(0.025);
                  },
                  itemCount: 10),
            )
          ],
        ),
      ),
      floatingActionButton: const HomeScreenFloatingActionButton(),
    );
  }


  
}

