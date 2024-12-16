import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar customAppBar() {
  return AppBar(
    title: Text('Notes',
      style:AppTextStyles.bold23.copyWith(
        color: const Color(0xFFB0B9C4),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color:const Color(0xFFD48445).withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}