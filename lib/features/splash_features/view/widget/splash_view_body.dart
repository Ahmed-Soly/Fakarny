import 'package:flutter/material.dart';
import 'package:note/core/utils/app_text_styles.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  // function of animation
  void initSlidingAnimation(){
    animationController=AnimationController(vsync: this,duration:const Duration(seconds:3),);
    slidingAnimation=Tween<Offset>(begin:const Offset(0,4) ,end:Offset.zero).animate(animationController);
    animationController.forward();
  }

  @override
  void initState() {
    initSlidingAnimation();
    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  // function of navigate after navigation
  void navigateToHome(){
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, AppRoutes.homeView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.imagesSplash),
        const SizedBox(height: 10.0,),
        AnimatedBuilder(
            animation:slidingAnimation,
            builder: (context, child)=>SlideTransition(
                position: slidingAnimation,
              child:Text('Let\'s Craft Your Thoughts',
                textAlign:TextAlign.center,
                style: AppTextStyles.bold20.copyWith(
                  color:Colors.white,
                ),
              ),
            )
        )

      ],
    );
  }
}
