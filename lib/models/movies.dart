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

factory Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
    title: json["title"] ?? "Unknown Title",
    backDropPath: json["backdrop_path"] ?? "", // Provide a default value or empty string
    originalTitle: json["original_title"] ?? "",
    overview: json["overview"] ?? "No overview available",
    posterPath: json["poster_path"] ?? "", // Provide a default value or empty string
    releaseDate: json["release_date"] ?? "",
    voteAverage: json["vote_average"] ?? 0.0, // Provide a default value or 0.0
  );
}

  //post
  
}
