import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';
import 'package:sipnudge_machine_task/cubit/navigation_cubit.dart';
import 'package:sipnudge_machine_task/widgets/nav_border.dart';
import 'package:sipnudge_machine_task/widgets/selected_nav.dart';

class NavItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool selected;
  final int index;

  const NavItem({
    super.key,
    required this.icon,
    required this.name,
    required this.selected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: selected ? 2 : 1,
      child: GestureDetector(
        onTap: () => context.read<NavigationCubit>().changeIndex(index),
        child: selected
            ? SelectedNav(icon: icon, name: name)
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: AppColors.inactivecolor),
                    Text(name, style: AppTypography.navInactive),
                  ],
                ),
              ),
      ),
    );
  }
}
