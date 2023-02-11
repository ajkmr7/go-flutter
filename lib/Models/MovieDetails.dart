class MovieDetails {
  double rating;
  int votes;
  List<String> categories;
  String runtime;
  List<String> genres;
  String censorCertificate;
  DateTime releaseDate;
  String description;

  MovieDetails(
      {required this.rating,
      required this.votes,
      required this.categories,
      required this.runtime,
      required this.genres,
      required this.censorCertificate,
      required this.releaseDate,
      required this.description});
}
