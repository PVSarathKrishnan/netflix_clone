import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Adjust app bar color
        elevation: 0,
        title: Image.asset(
          "lib/assets/logo.png",
          filterQuality: FilterQuality.high,
          height: 40,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.black54], // Add background gradient
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Text(
                  "Trending Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: CarouselSlider.builder(
                  itemCount: 10,
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 0.6, // Adjust visible item size
                    enableInfiniteScroll: true, // Enable infinite scroll
                    autoPlay: true, // Enable auto-play
                    autoPlayInterval:
                        Duration(seconds: 3), // Set auto-play interval
                  ),
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://via.placeholder.com/200x300"), // Use actual movie poster image
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
