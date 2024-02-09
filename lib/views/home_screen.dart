import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/style/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "lib/assets/logo.png",
          filterQuality: FilterQuality.high,
          height: 40,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
            child: Text("Trending Movies", style: Headings),
          ),
          SizedBox(
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: 10,
              options: CarouselOptions(
                height: 300
              ),
              itemBuilder: (context, itemIndex, pageViewIndex) {
                return Container(
                  height: 300,
                  width: 200,
                  color: Colors.blue,
                );
              },
            ),
          ) 
        ]),
      ),
    );
  }
}
