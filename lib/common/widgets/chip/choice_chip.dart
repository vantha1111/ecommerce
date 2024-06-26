import 'package:computer_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UChoiceChip extends StatelessWidget {
  const UChoiceChip({
    super.key, 
    required this.text, 
    required this.selected, 
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor:Colors.transparent),
      child: ChoiceChip(
        label: UHelper.getColor(text) != null ? const SizedBox() : Text (text), 
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? UColors.white : null ), 
        avatar: UHelper.getColor(text) != null 
        ? UCircularContainer(width: 50,height: 50, backgroundColor: UHelper.getColor(text) !) :null,  
        shape: const CircleBorder(),
        labelPadding: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        selectedColor: Colors.green,
        backgroundColor: Colors.green,
        ),
    );
  }
}

