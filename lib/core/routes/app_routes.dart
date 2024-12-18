import 'package:flutter/material.dart';

import '../../features/home_features/view/home_view.dart';
import '../../features/search_feature/view/search_view.dart';
import '../../features/splash_features/view/splash_view.dart';


class AppRoutes{

  static const splashView='splash';
  static const homeView='home';
  static const searchView='search';
  static const updateView='update';


  static Route<dynamic> onGenerateRoute (RouteSettings settings){
    switch(settings.name)
    {
      case 'splash':
        return MaterialPageRoute(builder: (context)=>const SplashView());
      case 'home':
        return MaterialPageRoute(builder: (context)=>const HomeView());
      case 'search':
         return MaterialPageRoute(builder: (context)=>const SearchView());
      default:
        return MaterialPageRoute(builder: (context)=>const SplashView());
    }

  }

}