import 'package:flutter/material.dart';

class CustomElevationButWithIcon extends StatelessWidget {
  const CustomElevationButWithIcon({super.key, required this.text, this.press, required this.icon});
  final String text;
  final void Function()? press;
  final Widget?  icon;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed:press,
      label:Text(text,
        style: const TextStyle(
          color: Color(0xff1A1C1E),
          fontSize: 14,
        ),
      ),
      icon:icon,
    );
  }
}
