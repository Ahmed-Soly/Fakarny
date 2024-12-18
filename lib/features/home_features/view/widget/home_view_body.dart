import 'package:flutter/material.dart';
import '../../../../../generated/assets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.imagesHome),
        const SizedBox(height: 10,),
        const Text('No Notes! create your first note',textAlign: TextAlign.center,),
      ],
    );
  }
}
