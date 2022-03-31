import 'review.dart';

class Location {
  String name;
  String description;
  String imageUrl;
  int likes;
  String address;
  List<Review> reviews;

  Location ({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.likes,
    required this.address,
    required this.reviews,
  });

}