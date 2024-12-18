import 'package:flutter/material.dart';

class InActiveColor extends StatelessWidget {
  const InActiveColor({super.key, required this.color});
  final int color;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor:Color(color),
      radius: 28,
    );
  }
}