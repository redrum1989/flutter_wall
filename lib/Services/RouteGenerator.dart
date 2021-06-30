import 'package:flutter/material.dart';
import 'package:flutter_wall/Screens/initial_screen.dart';
import 'package:flutter_wall/Screens/login_screen.dart';
import 'package:flutter_wall/Screens/register_screen.dart';
import 'package:provider/provider.dart';

Route<Null> getGenerateRoute(RouteSettings settings){

  switch(settings.name){

    case InitialScreen.routeName:
      return PageRouteBuilder(
        settings: RouteSettings(name: InitialScreen.routeName),
        pageBuilder: (context, animation, secondaryAnimation){
          return ListenableProvider(
            create: (context) => animation,
            child: InitialScreen(),
          );
        },
      );
    
    case LoginScreen.routeName:
      return PageRouteBuilder(
        settings: RouteSettings(name: LoginScreen.routeName),
        pageBuilder: (context, animation, secondaryAnimation){
          return ListenableProvider(
            create: (context) => animation,
            child: LoginScreen(),
          );
        },
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child){
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }
      );

    case RegisterScreen.routeName:
      return PageRouteBuilder(
        settings: RouteSettings(name: RegisterScreen.routeName),
        pageBuilder: (context, animation, secondaryAnimation){
          return ListenableProvider(
            create: (context) => animation,
            child: RegisterScreen(),
          );
        },
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child){
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }
      );

  }

  return null;
}