import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        width: MediaQuery.of(context).size.width, // Set width to screen width
        height:
            MediaQuery.of(context).size.height, // Set height to screen height
        child: Transform.scale(
          scale:
              2.5, // Adjust the scale factor as needed to zoom in on the animation
          child: Lottie.asset(
            "lib/assets/Splash.json",
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      duration: 3000,
      backgroundColor: Colors.black,
      nextScreen: HomeScreen(),
    );
  }
}
