class Movie {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String,dynamic>json) {//get
    return Movie(
    title: json["title"]??"default title",
    backDropPath: json["backdrop_path"], 
    originalTitle: json["original_title"], 
    overview: json["overview"],
    posterPath: json["poster_path"], 
    releaseDate: json["release_date"], 
    voteAverage: json["vote_average"]
    );
  }

  //post
  
}
