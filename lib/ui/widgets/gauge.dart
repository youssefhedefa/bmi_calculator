import 'package:bmi_calculator/helper/color_helper.dart';
import 'package:bmi_calculator/helper/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatefulWidget {
  const Gauge({super.key, required this.value});

  final double value;

  @override
  State<Gauge> createState() => _GaugeState();
}

class _GaugeState extends State<Gauge> {

  double opacity = 0;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 3100,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 60,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: widget.value,
                  color: AppColorHelper.blueColor,
                ),
              ],
              pointers: [
                NeedlePointer(
                  value: widget.value,
                  enableAnimation: true,
                  needleColor: AppColorHelper.primaryColor,
                ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 70,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 3100),
            curve: Curves.easeInCirc,
            opacity: opacity,
            child: Text(
              widget.value.toStringAsFixed(1),
              style: AppTextStyleHelper.font30PrimaryBold,
            ),
          ),
        ),
      ],
    );
  }
}
