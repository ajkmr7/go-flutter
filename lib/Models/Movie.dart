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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['movies'] = movies.map((movie) => movie.toJson()).toList();
    return data;
  }
}

class Movie {
  late String id;
  late String name;
  late List<String> carouselImages;
  late String poster;
  late AdditionalDetails additionalDetails;
  late String trailerURLPath;
  late Flags flags;

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
    flags = Flags.fromJson(json['flags']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['carouselImages'] = carouselImages;
    data['poster'] = poster;
    data['additionalDetails'] = additionalDetails.toJson();
    data['trailerURLPath'] = trailerURLPath;
    data['flags'] = flags.toJson();
    return data;
  }
}

class AdditionalDetails {
  late double rating;
  late int votes;
  late List<String> categories;
  late String runtime;
  late List<String> genres;
  late String censorCertificate;
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
    rating = json['rating'];
    votes = json['votes'];
    categories = json['categories'].cast<String>();
    runtime = json['runtime'];
    genres = json['genres'].cast<String>();
    censorCertificate = json['censorCertificate'];
    releaseDate = json['releaseDate'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['votes'] = votes;
    data['categories'] = categories;
    data['runtime'] = runtime;
    data['genres'] = genres;
    data['censorCertificate'] = censorCertificate;
    data['releaseDate'] = releaseDate;
    data['description'] = description;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isNewRelease'] = isNewRelease;
    data['isNowShowing'] = isNowShowing;
    data['isBookingsOpen'] = isBookingsOpen;
    return data;
  }
}
