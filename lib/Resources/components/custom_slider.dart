// Package Dependencies
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Models
import 'package:first_app/models/cast_and_crew_profile.dart';

// Theme
import '../../resources/theme/color.dart';

class CustomSlider extends StatefulWidget {
  final CastAndCrewProfiles avatars;
  final int initialIndex;

  const CustomSlider({super.key, required this.avatars, this.initialIndex = 0});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _currentIndex = 0;
  late int _tappedIndex;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _tappedIndex = _currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselSlider(
            items: widget.avatars.castAndCrewProfiles.map((avatar) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _tappedIndex =
                            widget.avatars.castAndCrewProfiles.indexOf(avatar);
                      });
                      _controller.animateToPage(_tappedIndex,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut);
                    },
                    child: _currentIndex ==
                            widget.avatars.castAndCrewProfiles.indexOf(avatar)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 72,
                                width: 72,
                                child: ClipOval(
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image.asset(avatar.profilePicture),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 72,
                            width: 72,
                            child: ClipOval(
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(avatar.profilePicture),
                              ),
                            ),
                          ),
                  );
                },
              );
            }).toList(),
            carouselController: _controller,
            options: CarouselOptions(
              height: 75,
              viewportFraction: 0.33,
              enlargeCenterPage: true,
              initialPage: widget.initialIndex,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                  _tappedIndex = _currentIndex;
                });
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.avatars.castAndCrewProfiles[_tappedIndex].name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: 'NunitoSans',
                color: textPrimary,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            widget.avatars.castAndCrewProfiles[_tappedIndex].designation,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
