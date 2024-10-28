import 'package:flutter/material.dart';
import 'package:yes_no_app_geisler_quintal/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes_No_App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material_App_Bar'),
        ),
        body: const Center(
          child: Text('Helo world'),
        ),
      ),
    );
  }
}
