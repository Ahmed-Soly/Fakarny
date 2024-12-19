import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

AppBar customViewNoteAppBar({
  required String text,
  required VoidCallback action,
  required Widget icon,
  Widget? widget,
}){
  return AppBar(
    leading:widget,
    title: Text(text,
      style:AppTextStyles.bold16.copyWith(
        color: const Color(0xFFB0B9C4),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          onPressed: action,
          icon: icon,
        ),
      ),
    ],
  );
}


