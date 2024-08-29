import 'dart:developer';
import 'package:bmi_calculator/helper/color_helper.dart';
import 'package:bmi_calculator/helper/text_style_helper.dart';
import 'package:bmi_calculator/ui/result.dart';
import 'package:bmi_calculator/ui/widgets/custom_slider.dart';
import 'package:bmi_calculator/ui/widgets/gender.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double height = 160;
  double weight = 127.5;
  late double bmi;
  setHeight(double value) {
    height = value;
  }

  setWeight(double value) {
    weight = value;
  }

  calculateBMI() {
    double heightInMeter = height / 100;
    bmi = weight / (heightInMeter * heightInMeter);
    log(bmi.toString());
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BMI Calculator',
                style: AppTextStyleHelper.font30PrimaryBold,
              ),
              const SizedBox(height: 30),
              buildLabel(label: 'Gender'),
              const GenderSelection(),
              const SizedBox(height: 30),
              buildLabel(label: 'Height'),
              CustomSlider(
                max: 220,
                min: 100,
                label: 'cm',
                setValue: setHeight,
              ),
              const SizedBox(height: 30),
              buildLabel(label: 'Weight'),
              CustomSlider(
                max: 220,
                min: 35,
                label: 'kg',
                setValue: setWeight,
              ),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  calculateBMI();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultScreen(
                      value: bmi,
                    );
                  }));
                },
                color: AppColorHelper.blueColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Calculate !',
                  style: AppTextStyleHelper.font28WhiteBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildLabel({required String label}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          label,
          style: AppTextStyleHelper.font22GreyMedium,
        ),
      );
}
