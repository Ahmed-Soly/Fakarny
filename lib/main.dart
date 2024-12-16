import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/routes/app_routes.dart';

import 'core/function_helper/blocObserver.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor:const Color(0xff202C40),
      ),
      onGenerateRoute:AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splashView,
    );
  }
}

