import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/widgets/custem_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustemScaffold(body: Center(child: Text("HomeScreen")));
  }
}
