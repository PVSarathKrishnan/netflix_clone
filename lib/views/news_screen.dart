import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/style/text_style.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text('Film Previews',style: Headings,),
        
      ),
      body: FutureBuilder(
        future: upcomingMovies,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final List<Movie> movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final Movie movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w200${movie.backDropPath}',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: SubHeadings
                              ),
                              SizedBox(height: 8),
                              Text(
                                movie.overview,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Release Date: ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '${movie.releaseDate}',
                                style:Description
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
