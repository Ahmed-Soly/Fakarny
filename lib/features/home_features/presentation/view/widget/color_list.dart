import 'package:flutter/material.dart';
import '../../../domain/entity/color_entity.dart';
import 'color_list/active_color.dart';
import 'color_list/inactive_color.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key, required this.onColorSelected});
  final ValueChanged<int> onColorSelected;

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: colorsList.asMap().entries.map((entry) {
          int index = entry.key;
          ColorEntity color = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  currentIndex=index;
                });
                widget.onColorSelected(index);
              },
              child: index == currentIndex ?
              ActiveColor(color: color.color,) :
              InActiveColor(color: color.color,),
            ),
          );
        }).toList(),
      ),
    );
  }
}







