import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/style/text_style.dart';
import 'package:netflix_clone/views/description_screen.dart';
import 'package:netflix_clone/views/news_screen.dart';
import 'package:netflix_clone/widgets/constants.dart';
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
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcominggMovies;
  late Future<List<Movie>> nowPlayingMovies;
  late TextEditingController _searchController;
  late StreamController<List<Movie>> _searchResultsController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchResultsController = StreamController<List<Movie>>();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcominggMovies = Api().getUpcomingMovies();
    nowPlayingMovies = Api().getNowPlayingMovies();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchResultsController.close();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Call your search function here with the text entered in the search bar
      _searchMovies(text);
    });
  }

  void _searchMovies(String query) {
    if (query.isNotEmpty) {
      // Perform search operation using API
      Api().searchMovies(query).then((movies) {
        _searchResultsController.add(movies);
      }).catchError((error) {
        _searchResultsController.addError(error);
      });
    } else {
      _searchResultsController.add([]);
    }
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
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              );
            },
          ),
        ],
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
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Text("Trending Movies", style: Headings),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      // final data = snapshot.data;
                      return TrendingSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 240, 0, 0)),
                      );
                    }
                  },
                ),
              ),
              //top rated collection
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Text("Now Playing", style: Headings),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MoviesSlider(snapshot: snapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 240, 0, 0)),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Text("Top Rated Movies", style: Headings),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      // final data = snapshot.data;
                      return MoviesSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 240, 0, 0)),
                      );
                    }
                  },
                ),
              ),
              //Up coming movies

              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Text("Upcoming Movies", style: Headings),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: upcominggMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      // final data = snapshot.data;
                      return MoviesSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 240, 0, 0)),
                      );
                    }
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

class MovieSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: Api().searchMovies(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final List<Movie> movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final Movie movie = movies[index];
              return ListTile(
                leading: Image.network(
                  "${Constants.imagePath}${movie.posterPath}",
                  width: 50,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  movie.overview,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionPage(movie: movie),
                      ));
                },
              );
            },
          );
        } else {
          return Center(
            child: Text('No results found'),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement logic to show suggestions as the user types
    return Container(
      child: Center(
        child: Text('Search Suggestions for: $query'),
      ),
    );
  }
}
