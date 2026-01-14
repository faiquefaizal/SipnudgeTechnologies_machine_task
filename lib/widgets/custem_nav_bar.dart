import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/cubit/navigation_cubit.dart';
import 'package:sipnudge_machine_task/widgets/nav_border.dart';
import 'package:sipnudge_machine_task/widgets/nav_item.dart';

class CustemNavBar extends StatelessWidget {
  const CustemNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final navHeight = size.height * 0.11;
    int currentIndex = context.watch<NavigationCubit>().state;
    return NavBorder(
      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 20),
      borderRadius: BorderRadius.circular(45),
      child: Container(
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        height: navHeight,
        decoration: BoxDecoration(
          color: AppColors.navColor,

          borderRadius: BorderRadius.circular(45),
          border: Border.all(color: AppColors.navColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(
              icon: Icons.home_filled,
              name: "Home",
              index: 0,
              selected: currentIndex == 0,
            ),
            NavItem(
              icon: Icons.bar_chart_rounded,
              name: "Analysis",
              index: 1,
              selected: currentIndex == 1,
            ),
            NavItem(
              icon: Icons.emoji_events_rounded,
              name: "Goal",
              index: 2,
              selected: currentIndex == 2,
            ),
            NavItem(
              icon: Icons.settings_rounded,
              name: "Settings",
              index: 3,
              selected: currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}
