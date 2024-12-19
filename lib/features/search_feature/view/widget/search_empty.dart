import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(Assets.imagesSearch),
            const SizedBox(height: 20,),
            Text('Search of your notes',
              textAlign: TextAlign.center,
              style:AppTextStyles.bold20,
            ),
          ],
        ),
      ),
    );
  }
}
