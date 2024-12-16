import 'package:flutter/material.dart';

class ActiveColor extends StatelessWidget {
  const ActiveColor({super.key, required this.color});
  final int color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:Colors.white,
      radius: 30,
      child:CircleAvatar(
        backgroundColor:Color(color),
        radius: 28,
      ),
    );
  }
}