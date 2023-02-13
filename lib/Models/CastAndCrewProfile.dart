class CastAndCrewProfiles {
  late List<CastAndCrewProfile> castAndCrewProfiles;

  CastAndCrewProfiles({required this.castAndCrewProfiles});

  CastAndCrewProfiles.fromJson(Map<String, dynamic> json) {
    if (json['castAndCrewProfiles'] != null) {
      castAndCrewProfiles = <CastAndCrewProfile>[];
      json['castAndCrewProfiles'].forEach((castAndCrewProfile) {
        castAndCrewProfiles
            .add(CastAndCrewProfile.fromJson(castAndCrewProfile));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['castAndCrewProfiles'] = castAndCrewProfiles
        .map((castAndCrewProfile) => castAndCrewProfile.toJson())
        .toList();
    return data;
  }
}

class CastAndCrewProfile {
  late String id;
  late String name;
  late String profilePicture;
  late String designation;
  late String associatedType;

  CastAndCrewProfile(
      {required this.id,
      required this.name,
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
