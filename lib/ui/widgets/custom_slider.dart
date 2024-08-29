import 'package:bmi_calculator/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.max, required this.min, required this.label, this.setValue});

  final double max;
  final double min;
  final String label;
  final Function? setValue;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {

  late double _currentSliderValue;

  @override
  void initState() {
    _currentSliderValue = (widget.max + widget.min ) / 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeightOrWeightIndicator(
          heightOrWeight: _currentSliderValue.toStringAsFixed(1),
          label: widget.label,
        ),
        Slider(
          value: _currentSliderValue,
          min: widget.min,
          max: widget.max,
          onChanged: (value) {
            setState(() {
              _currentSliderValue = value;
            });
            widget.setValue!(value);
          },
        ),
      ],
    );
  }
}

class HeightOrWeightIndicator extends StatelessWidget {
  const HeightOrWeightIndicator({super.key, required this.heightOrWeight, required this.label});

  final String heightOrWeight;
  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: heightOrWeight, // Default style
        style: AppTextStyleHelper.font30PrimaryBold,
        children: [
          TextSpan(
            text: '  $label', // Different style
            style: AppTextStyleHelper.font22GreyMedium,
          ),
        ],
      ),
    );
  }
}
