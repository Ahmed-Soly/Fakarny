import 'package:flutter/material.dart';

class CustomElevationButton extends StatelessWidget {
  const CustomElevationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () {},
      child: const Text(
        'Add to cart',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff1A1C1E),
        ),
      ),
    );
  }
}
