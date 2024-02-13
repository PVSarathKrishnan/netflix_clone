
import 'package:flutter/material.dart';
import 'package:netflix_clone/views/description_screen.dart';
import 'package:netflix_clone/widgets/constants.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context ,index) {
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: GestureDetector(
           onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescriptionPage(movie: snapshot.data[index]),
                  ),
                );
              },
             child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: SizedBox(
                  height: 300,
                  width: 200,
                  child: Image.network(filterQuality: FilterQuality.high,fit: BoxFit.cover,
                "${Constants.imagePath}${snapshot.data![index].posterPath}"
                ),)
              ),
           ),
         );
        },
      ),
    );
  }
}
