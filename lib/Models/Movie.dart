// Dependent Models
import 'MovieDetails.dart';
import 'CastAndCrewProfile.dart';
import 'Review.dart';

class Movie {
  String name;
  List<String> posters;
  MovieDetails additionalDetails;
  List<CastAndCrewProfile> castAndCrewProfiles;
  List<Review> reviews;
  String trailerURLPath;

  Movie(
      {required this.name,
      required this.posters,
      required this.additionalDetails,
      required this.castAndCrewProfiles,
      required this.reviews,
      required this.trailerURLPath});
}
