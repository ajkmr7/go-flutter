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
    data['movies'] = movies.map((v) => v.toJson()).toList();
    return data;
  }
}

class Movie {
  late String name;
  late List<String> posters;
  late AdditionalDetails additionalDetails;
  late List<CastAndCrewProfile> castAndCrewProfiles;
  late List<Review> reviews;
  late String trailerURLPath;
  late Flags flags;

  Movie(
      {required this.name,
      required this.posters,
      required this.additionalDetails,
      required this.castAndCrewProfiles,
      required this.reviews,
      required this.trailerURLPath,
      required this.flags});

  Movie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    posters = json['posters'].cast<String>();
    additionalDetails = (json['additionalDetails'] != null
        ? AdditionalDetails.fromJson(json['additionalDetails'])
        : null)!;
    if (json['castAndCrewProfiles'] != null) {
      castAndCrewProfiles = <CastAndCrewProfile>[];
      json['castAndCrewProfiles'].forEach((v) {
        castAndCrewProfiles.add(CastAndCrewProfile.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Review>[];
      json['reviews'].forEach((v) {
        reviews.add(Review.fromJson(v));
      });
    }
    trailerURLPath = json['trailerURLPath'];
    flags = Flags.fromJson(json['flags']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['posters'] = posters;
    data['additionalDetails'] = additionalDetails.toJson();
    data['castAndCrewProfiles'] =
        castAndCrewProfiles.map((v) => v.toJson()).toList();
    data['reviews'] = reviews.map((v) => v.toJson()).toList();
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

class CastAndCrewProfile {
  late String name;
  late String profilePicture;
  late String designation;
  late String associatedType;

  CastAndCrewProfile(
      {required this.name,
      required this.profilePicture,
      required this.designation,
      required this.associatedType});

  CastAndCrewProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profilePicture'];
    designation = json['designation'];
    associatedType = json['associatedType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profilePicture'] = profilePicture;
    data['designation'] = designation;
    data['associatedType'] = associatedType;
    return data;
  }
}

class Review {
  late String username;
  late int rating;
  late String comments;
  late int likeCount;
  late String date;

  Review(
      {required this.username,
      required this.rating,
      required this.comments,
      required this.likeCount,
      required this.date});

  Review.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    rating = json['rating'];
    comments = json['comments'];
    likeCount = json['likeCount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['rating'] = rating;
    data['comments'] = comments;
    data['likeCount'] = likeCount;
    data['date'] = date;
    return data;
  }
}

class Flags {
  late bool isNewRelease;

  Flags({required this.isNewRelease});

  Flags.fromJson(Map<String, dynamic> json) {
    isNewRelease = json['isNewRelease'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isNewRelease'] = isNewRelease;
    return data;
  }
}
