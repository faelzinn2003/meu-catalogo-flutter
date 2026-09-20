import 'package:flutter/material.dart';

import 'controllers/item_controller.dart';
import 'theme/app_theme.dart';
import 'views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ItemController controller = ItemController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo Pessoal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: HomePage(controller: controller),
    );
  }
}
