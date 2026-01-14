import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';

class NavBorder extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry borderRadius;
  const NavBorder({
    super.key,
    required this.child,
    this.margin,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,

      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: const LinearGradient(
          colors: [
            AppColors.navBorderGradientTop,
            AppColors.navBorderGradientBottom,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
