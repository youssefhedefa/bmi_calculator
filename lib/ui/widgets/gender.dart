import 'package:bmi_calculator/ui/widgets/gender_card.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {

  bool isMaleSelected = true;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          GenderCard(
            icon: Icons.female,
            isSelected: isFemaleSelected,
            onTap: () {
              setState(() {
                isFemaleSelected = true;
                isMaleSelected = false;
              });
            },
          ),
          GenderCard(
            icon: Icons.male,
            isSelected: isMaleSelected,
            onTap: () {
              setState(() {
                isFemaleSelected = false;
                isMaleSelected = true;
              });
            },
          ),
        ],
      ),
    );
  }
}

