class Review {
  String reviewerName;
  int rating;
  String reviewComments;
  int likeCount;
  DateTime date;

  Review(
      {required this.reviewerName,
      required this.rating,
      required this.reviewComments,
      required this.likeCount,
      required this.date});
}
