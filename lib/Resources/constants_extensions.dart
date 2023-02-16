// Constants
import 'constants.dart';

extension MovieCategoryExtension on MovieCategory {
  String getName() {
    switch (this) {
      case MovieCategory.TWO_D:
        return "2D";
      case MovieCategory.IMAX_2D:
        return "IMAX 2D";
      case MovieCategory.THREE_D:
        return "3D";
      case MovieCategory.IMAX_3D:
        return "IMAX 3D";
      case MovieCategory.TAMIL:
        return "TAMIL";
      case MovieCategory.TELUGU:
        return "TELUGU";
      case MovieCategory.MALAYALAM:
        return "MALAYALAM";
      case MovieCategory.KANNADA:
        return "KANNADA";
      case MovieCategory.HINDI:
        return "HINDI";
      case MovieCategory.ENGLISH:
        return "ENGLISH";
    }
  }
}

extension GenreExtension on MovieGenre {
  String getName() {
    switch (this) {
      case MovieGenre.ACTION:
        return "Action";
      case MovieGenre.COMEDY:
        return "Comedy";
      case MovieGenre.DRAMA:
        return "Drama";
      case MovieGenre.FANTASY:
        return "Fantasy";
      case MovieGenre.HORROR:
        return "Horror";
      case MovieGenre.MYSTERY:
        return "Mystery";
      case MovieGenre.ROMANCE:
        return "Romance";
      case MovieGenre.THRILLER:
        return "Thriller";
    }
  }
}

MovieCategory? movieCategoryEnumFromString(String value) {
  switch (value) {
    case "2D":
      return MovieCategory.TWO_D;
    case "IMAX 2D":
      return MovieCategory.IMAX_2D;
    case "3D":
      return MovieCategory.THREE_D;
    case "IMAX 3D":
      return MovieCategory.IMAX_3D;
    case "Tamil":
      return MovieCategory.TAMIL;
    case "Telugu":
      return MovieCategory.TELUGU;
    case "Malayalam":
      return MovieCategory.MALAYALAM;
    case "Kannada":
      return MovieCategory.KANNADA;
    case "Hindi":
      return MovieCategory.HINDI;
    case "English":
      return MovieCategory.ENGLISH;
    default:
      return null;
  }
}

MovieGenre? movieGenreEnumFromString(String value) {
  switch (value) {
    case "Action":
      return MovieGenre.ACTION;
    case "Comedy":
      return MovieGenre.COMEDY;
    case "Drama":
      return MovieGenre.DRAMA;
    case "Fantasy":
      return MovieGenre.FANTASY;
    case "Horror":
      return MovieGenre.HORROR;
    case "Mystery":
      return MovieGenre.MYSTERY;
    case "Romance":
      return MovieGenre.ROMANCE;
    case "Thriller":
      return MovieGenre.THRILLER;
    default:
      return null;
  }
}
