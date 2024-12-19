import 'package:flutter/material.dart';
import 'package:note/core/model/note_model.dart';
import 'package:note/features/show_item_feature/view/show_note_view.dart';

import '../../features/home_features/view/home_view.dart';
import '../../features/search_feature/view/search_view.dart';
import '../../features/splash_features/view/splash_view.dart';


class AppRoutes{

  static const splashView='splash';
  static const homeView='home';
  static const searchView='search';
  static const showItemView='showItem';


  static Route<dynamic> onGenerateRoute (RouteSettings settings){
    switch(settings.name)
    {
      case 'splash':
        return MaterialPageRoute(builder: (context)=>const SplashView());
      case 'home':
        return MaterialPageRoute(builder: (context)=>const HomeView());
      case 'search':
         return MaterialPageRoute(builder: (context)=>const SearchView());
      case 'showItem':
        final NoteModel note = settings.arguments as NoteModel;
        return MaterialPageRoute(builder: (context)=>ShowItemView(note: note,));
      default:
        return MaterialPageRoute(builder: (context)=>const SplashView());
    }

  }

}