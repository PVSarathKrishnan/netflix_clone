import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/splash_screen.dart';

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
        home: SplashScreen());
  }
}
