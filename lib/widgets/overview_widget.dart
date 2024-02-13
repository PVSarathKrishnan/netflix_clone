import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/style/text_style.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Overview",
          style: SubHeadings.copyWith(fontSize: 28),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          movie.overview,
          style: Description,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          child: Row(
            children: [
              //release date
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      "Release Date :",
                      style: Description.copyWith(fontSize: 14),
                    ),
                    Text(
                      " ${movie.releaseDate}",
                      style: Description.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      "Rating :",
                      style: Description.copyWith(fontSize: 14),
                    ),
                    Text(
                      " ${(movie.voteAverage).toStringAsFixed(1)}",
                      style: Description.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 19,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: 4,
                ),
                Text("Play",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Color.fromARGB(255, 17, 17, 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline, color: Colors.white, size: 30),
                SizedBox(
                  width: 4,
                ),
                Text("Add to watchList",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
          ),
        ),
        
      ],
    );
  }
}
