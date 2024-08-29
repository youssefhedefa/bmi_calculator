import 'package:bmi_calculator/helper/color_helper.dart';
import 'package:bmi_calculator/helper/text_style_helper.dart';
import 'package:bmi_calculator/models/classification_result.dart';
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
                value: 30,
              ),
              const ListOfClassifications(),
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

class ListOfClassifications extends StatelessWidget {
  const ListOfClassifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => Classification(
          model: ClassificationResultModel(
            label: 'Normal',
            confidence: '30%',
            isSelected: index == 0,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 4,
      ),
    );
  }
}

class Classification extends StatelessWidget {
  const Classification({super.key, required this.model});

  final ClassificationResultModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          model.confidence,
          style: buildStyle(),
        ),
        const Spacer(),
        Text(
          model.label,
          style: buildStyle(),
        ),
      ],
    );
  }
  buildStyle() {
    return model.isSelected ? AppTextStyleHelper.font30PrimaryBold.copyWith(
      fontSize: 24,
    ) : AppTextStyleHelper.font22GreyMedium;
  }
}
