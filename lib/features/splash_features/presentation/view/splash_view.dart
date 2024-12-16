import 'package:flutter/material.dart';
import 'package:note/features/splash_features/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SplashViewBody(),
    );
  }
}
