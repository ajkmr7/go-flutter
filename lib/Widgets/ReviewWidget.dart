// Package Dependencies
import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget(
      {super.key,
      required this.reviewerName,
      required this.rating,
      required this.reviewComments,
      required this.likeCount,
      required this.date});

  final String reviewerName;
  final int rating;
  final String reviewComments;
  final int likeCount;
  final DateTime date;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool _isLiked = false;
  bool _isDisliked = false;
  int likes = 0;

  @override
  void initState() {
    likes = widget.likeCount;
  }

  void _toggleLike() {
    setState(() {
      if (_isDisliked && !_isLiked) {
        _toggleDislike();
      }
      if (_isLiked) {
        _isLiked = false;
        likes--;
      } else {
        _isLiked = true;
        likes++;
      }
    });
  }

  void _toggleDislike() {
    setState(() {
      if (!_isDisliked && _isLiked) {
        _toggleLike();
      }
      _isDisliked = !_isDisliked;
    });
  }

  String _daysInBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 72,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromRGBO(85, 85, 85, 1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle, color: Colors.grey[200], size: 48),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.reviewerName,
                        softWrap: true,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Booked on',
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
                            child: SizedBox(
                                height: 24,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(
                                      'assets/images/bookmyshow.png'),
                                )),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.red[400],
                    size: 18,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('${widget.rating}/10',
                      style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.reviewComments,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color.fromRGBO(85, 85, 85, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        iconSize: 14,
                        icon: const Icon(Icons.thumb_up_alt_outlined),
                        color: _isLiked ? Colors.red[400] : Colors.grey[400],
                        padding: const EdgeInsets.all(0),
                        onPressed: () => _toggleLike(),
                      ),
                      Text(
                        '${likes}',
                        style: const TextStyle(
                            color: Color.fromRGBO(85, 85, 85, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        iconSize: 14,
                        icon: const Icon(Icons.thumb_down_alt_outlined),
                        color: _isDisliked ? Colors.red[400] : Colors.grey[400],
                        padding: const EdgeInsets.all(0),
                        onPressed: () => _toggleDislike(),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_daysInBetween(widget.date, DateTime.now())} days ago',
                        style: const TextStyle(
                            color: Color.fromRGBO(85, 85, 85, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.grey[400],
                        size: 14,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
