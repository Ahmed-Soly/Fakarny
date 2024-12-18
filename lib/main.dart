import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/routes/app_routes.dart';

import 'core/function_helper/bloc_observer.dart';
import 'core/services/get_it.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  getSetup();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff202C40), // Background color of the status bar
      statusBarIconBrightness: Brightness.light, // Light icons on the status bar
    ));
    return MaterialApp(
      title: 'My Notes',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor:const Color(0xff202C40),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff202C40),
        )
      ),
      onGenerateRoute:AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splashView,
      debugShowCheckedModeBanner:false,
    );
  }
}

