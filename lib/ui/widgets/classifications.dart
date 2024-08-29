import 'package:bmi_calculator/models/classification_result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/helper/text_style_helper.dart';

class ListOfClassifications extends StatelessWidget {
  const ListOfClassifications({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => Classification(
          model: buildModel()[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: buildModel().length,
      ),
    );
  }

  List<ClassificationResultModel> buildModel() {
    return [
      ClassificationResultModel(
        label: 'Underweight',
        confidence: '18.5 <',
        isSelected: value < 18.5,
      ),
      ClassificationResultModel(
        label: 'Healthy',
        confidence: '18.5 - 24.9',
        isSelected: value >= 18.5 && value <= 24.9,
      ),
      ClassificationResultModel(
        label: 'Overweight',
        confidence: '25 - 29.9',
        isSelected: value >= 25 && value <= 29.9,
      ),
      ClassificationResultModel(
        label: 'Obese',
        confidence: '30 - 34.9',
        isSelected: value >= 30 && value <= 34.9,
      ),
      ClassificationResultModel(
        label: 'Highly Obese',
        confidence: '35 - 39.9',
        isSelected: value >= 35 && value <= 39.9,
      ),
      ClassificationResultModel(
        label: 'Extremely Obese',
        confidence: '40 >',
        isSelected: value >= 40,
      ),
    ];
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
