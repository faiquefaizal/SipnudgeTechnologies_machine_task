import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';
import 'package:sipnudge_machine_task/widgets/nav_border.dart';

class SelectedNav extends StatelessWidget {
  final String name;
  final IconData icon;
  const SelectedNav({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return NavBorder(
      margin: EdgeInsets.symmetric(horizontal: 4),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: EdgeInsets.all(1),
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 23),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              AppColors.navItemGradientTop,
              AppColors.navItemGradientBottom,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            Text(name, style: AppTypography.navActive),
          ],
        ),
      ),
    );
  }
}
