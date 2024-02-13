import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/views/description_screen.dart';
import 'package:netflix_clone/widgets/constants.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 300,
          viewportFraction: 0.55, // visible item size
          enableInfiniteScroll: true, // infinite scroll
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          pageSnapping: true,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 1), // auto-play interval
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescriptionPage(movie :snapshot.data[itemIndex]),
                  ));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: SizedBox(
                  height: 300,
                  width: 200,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      "${Constants.imagePath}${snapshot.data[itemIndex].posterPath}"),
                )),
          );
        },
      ),
    );
  }
}
