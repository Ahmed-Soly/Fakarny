import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

class CustomElevationButton extends StatelessWidget {
  const CustomElevationButton({super.key, required this.text, required this.action});
  final String text;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:const Color(0xFFD48445),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed:action,
        child:Text(
          text,
          style:AppTextStyles.bold16.copyWith(
            color:Colors.white,
          ),
        ),
      ),
    );
  }
}
