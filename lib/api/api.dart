import 'dart:convert';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/widgets/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";

  static const _topRatedgUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";

  static const _upcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";

  static const _nowPlayingUrl =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}";

  static const _searchUrl =
      "https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=";

  //Api call for Movies

  //Now playing

  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(_nowPlayingUrl));//get method
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((m) => Movie.fromJson(m)).toList();
    } else {
      throw Exception("Something bad happend,at now playing movies");
    }
  }


  //trending
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((m) => Movie.fromJson(m)).toList();
    } else {
      throw Exception("Something bad happend, at trending movies");
    }
  }

  //top rated
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedgUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((m) => Movie.fromJson(m)).toList();
    } else {
      throw Exception("Something bad happend, at toprated movies");
    }
  }

  //upcoming
  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((m) => Movie.fromJson(m)).toList();
    } else {
      throw Exception("Something bad happend, at upcoming movies");
    }
  }

  //searching method 
  // by using Query 
  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse(_searchUrl + query));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((m) => Movie.fromJson(m)).toList();
    } else {
      throw Exception("Failed to search movies");
    }
  }
}
