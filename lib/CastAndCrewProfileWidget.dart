import 'package:flutter/material.dart';

class CastAndCrewProfileWidget extends StatelessWidget {
  final String name;
  final String profilePicture;
  final String designation;
  const CastAndCrewProfileWidget(
      {super.key,
      required this.name,
      required this.profilePicture,
      required this.designation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 64,
          width: 64,
          child: Material(
            elevation: 8,
            shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
            child: ClipOval(
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(profilePicture),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          name,
          softWrap: true,
          style: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          designation,
          style: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
