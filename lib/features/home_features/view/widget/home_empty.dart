import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.imagesHome),
        const SizedBox(height: 20,),
        Text('Create your first note',
          textAlign: TextAlign.center,
          style:AppTextStyles.bold20,
        ),
      ],
    );
  }
}
