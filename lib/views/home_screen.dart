import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/style/text_style.dart';
import 'package:netflix_clone/widgets/movie_slider.dart';
import 'package:netflix_clone/widgets/trending_movies_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  //calling api
late Future<List<Movie>> trendingMovies;
@override
void initState() {
  super.initState();
  trendingMovies = Api().getTrendingMovies();
}

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
            colors: const [
              Colors.black87,
              Colors.black54
            ], // Add background gradient
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
                child: Text("Trending Movies", style: Headings),
              ),
              TrendingSlider(),
              //top rated collection
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Text("Top Rated Movies", style: Headings),
              ),
              MoviesSlider(),
              //Up coming movies

              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Text("Upcoming Movies", style: Headings),
              ),
              MoviesSlider()
            ],
          ),
        ),
      ),
    );
  }
}
