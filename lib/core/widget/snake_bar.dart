import 'package:flutter/material.dart';
import 'package:note/core/utils/app_text_styles.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message,
        style:AppTextStyles.semiBold14.copyWith(
          color:Colors.white,
        ),
      ),
      backgroundColor:Colors.black.withOpacity(0.5),
    ),
  );
}
