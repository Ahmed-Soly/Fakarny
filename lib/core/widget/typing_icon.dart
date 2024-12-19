import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';

class TypingIcon extends StatelessWidget {
  const TypingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // Add padding to align it nicely
      child: SvgPicture.asset(
        Assets.imagesAdd, // Your SVG asset
        height: 24.0,
        width: 24.0,
      ),
    );
  }
}
