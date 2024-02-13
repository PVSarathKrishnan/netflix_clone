import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          height: 300,
          viewportFraction: 0.6, // visible item size
          enableInfiniteScroll: true, // infinite scroll
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          pageSnapping: true,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 3), // auto-play interval
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Container(
              height: 300,
              width: 200,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
