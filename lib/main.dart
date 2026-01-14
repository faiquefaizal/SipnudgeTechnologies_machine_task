import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/widgets/custem_scaffold.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SipNudge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.main,
      home: const MyHomePage(title: 'SipNudge Home'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustemScaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Initialize Theme')),
    );
  }
}
