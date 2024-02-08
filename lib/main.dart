
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(splash: Image.asset("lib/assets/logo.png"),
       splashTransition: SplashTransition.slideTransition,
       animationDuration: Duration(milliseconds: 1500),
       duration: 4000,
       backgroundColor: Colors.black,
       nextScreen: HomeScreen()),
    );
  }
}
