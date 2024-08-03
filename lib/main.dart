import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_provider/utils/colors.dart';
import 'package:to_do_app_provider/view/home_screen.dart';
import 'package:to_do_app_provider/view_model/todo_view_model.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider<TodoViewModel>(
      create: (context) => TodoViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: AppColors.whiteColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
