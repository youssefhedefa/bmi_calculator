import 'package:bmi_calculator/helper/color_helper.dart';
import 'package:bmi_calculator/helper/text_style_helper.dart';
import 'package:bmi_calculator/ui/widgets/classifications.dart';
import 'package:bmi_calculator/ui/widgets/gauge.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your BMI Result',
                style: AppTextStyleHelper.font30PrimaryBold,
              ),
              const Gauge(
                value: 20,
              ),
              const ListOfClassifications(
                value: 20,
              ),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: AppColorHelper.blueColor,
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Recalculate',
                  style: AppTextStyleHelper.font28BlueBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

