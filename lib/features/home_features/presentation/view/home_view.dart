import 'package:flutter/material.dart';
import 'package:note/features/home_features/presentation/view/widget/floating_button.dart';
import 'package:note/features/home_features/presentation/view/widget/home_view_body.dart';
import '../../../../core/widget/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(),
      floatingActionButton:const FloatingButton(),
      body: const HomeViewBody(),
    );
  }


}
