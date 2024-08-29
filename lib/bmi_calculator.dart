import 'package:bmi_calculator/helper/color_helper.dart';
import 'package:bmi_calculator/ui/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColorHelper.primaryColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}