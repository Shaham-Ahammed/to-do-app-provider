import 'package:flutter/material.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/utils/font.dart';
import 'package:to_do_app_provider/view/detail_screen.dart';


class ItemList extends StatelessWidget {
  final int index;
  const ItemList(
    this.index, {
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
            builder: (context) => const DetailScreen(),
          ));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: index % 2 == 0
                        ? AppColors.greyShadowColor
                        : AppColors.greenShadowColor,
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
              const CustomFont(
                "TASK 1",
                size: 0.05,
                fontWeight: FontWeight.w500,
              ),
              index % 2 == 0
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
