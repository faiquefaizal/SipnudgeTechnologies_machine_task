import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const CustomCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Theme data will be automatically applied from AppTheme
      child: Padding(
        padding: padding ?? const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
