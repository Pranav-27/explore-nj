import 'package:flutter/material.dart';

class Review {
  String body;
  String author;
  Icon profilePic;

  Review( {
    required this.body,
    required this.author,
    required this.profilePic,
  });
}