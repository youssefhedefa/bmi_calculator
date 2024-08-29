import 'package:bmi_calculator/helper/color_helper.dart';
import 'package:flutter/material.dart';


class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key, required this.icon, required this.isSelected, this.onTap});

  final IconData icon;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColorHelper.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: !isSelected ? AppColorHelper.primaryColor : Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
