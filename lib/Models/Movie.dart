// Constants
import '../resources/utitlity/constants.dart';
import '../resources/utitlity/constants_extensions.dart';

class Movies {
  late List<Movie> movies;

  Movies({required this.movies});

  Movies.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movie>[];
      json['movies'].forEach((v) {
        movies.add(Movie.fromJson(v));
      });
    }
  }
}

class Movie {
  late String id;
  late String name;
  late List<String> carouselImages;
  late String poster;
  late AdditionalDetails additionalDetails;
  late String trailerURLPath;
  late Set<MovieFlag> flags;

  Movie(
      {required this.id,
      required this.name,
      required this.carouselImages,
      required this.poster,
      required this.additionalDetails,
      required this.trailerURLPath,
      required this.flags});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    carouselImages = json['carouselImages'].cast<String>();
    poster = json['poster'];
    additionalDetails = (json['additionalDetails'] != null
        ? AdditionalDetails.fromJson(json['additionalDetails'])
        : null)!;
    trailerURLPath = json['trailerURLPath'];
    flags = Flags.fromJson(json['flags']).getFlags();
  }
}

class AdditionalDetails {
  late double rating;
  late int votes;
  late List<MovieCategory> categories;
  late String runtime;
  late List<MovieGenre> genres;
  late CensorCertificate censorCertificate;
  late String releaseDate;
  late String description;

  AdditionalDetails(
      {required this.rating,
      required this.votes,
      required this.categories,
      required this.runtime,
      required this.genres,
      required this.censorCertificate,
      required this.releaseDate,
      required this.description});

  AdditionalDetails.fromJson(Map<String, dynamic> json) {
    categories = [];
    genres = [];
    rating = json['rating'];
    votes = json['votes'];
    for (var categoryString in json['categories']) {
      var category = movieCategoryEnumFromString(categoryString);
      if (category != null) categories.add(category);
    }
    runtime = json['runtime'];
    for (var genreString in json['genres']) {
      var genre = movieGenreEnumFromString(genreString);
      if (genre != null) genres.add(genre);
    }
    censorCertificate = CensorCertificate.values.firstWhere(
        (certificate) => certificate.name == json['censorCertificate']);
    releaseDate = json['releaseDate'];
    description = json['description'];
  }
}

class Flags {
  late bool isNewRelease;
  late bool isNowShowing;
  late bool? isBookingsOpen;

  Flags(
      {required this.isNewRelease,
      required this.isNowShowing,
      required this.isBookingsOpen});

  Flags.fromJson(Map<String, dynamic> json) {
    isNewRelease = json['isNewRelease'];
    isNowShowing = json['isNowShowing'];
    isBookingsOpen = json['isBookingsOpen'] ?? json['isNowShowing'];
  }

  Set<MovieFlag> getFlags() {
    Set<MovieFlag> flags = {};
    if (isNewRelease) flags.add(MovieFlag.isNewRelease);
    if (isNowShowing) flags.add(MovieFlag.isNowShowing);
    if (isBookingsOpen != null && isBookingsOpen!) {
      flags.add(MovieFlag.isBookingsOpen);
    }
    return flags;
  }
}
