class CastAndCrewProfile {
  String name;
  String profilePicture;
  String designation;
  AssociatedType associatedType;

  CastAndCrewProfile(
      {required this.name,
      required this.profilePicture,
      required this.designation,
      required this.associatedType});
}

enum AssociatedType { cast, crew }
