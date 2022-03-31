import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data_models/review.dart';

class ReviewsPage extends StatefulWidget {
  List<Review> reviews;

  ReviewsPage({Key? key, required this.reviews}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  List<Review> _reviews = [];

  @override
  void initState() {
    super.initState();
    _reviews = widget.reviews;
  }

  void newReview(String text) {
    setState(() {
      _reviews.add(Review(
        body: text,
        author: "user",
        profilePic: const Icon(
          FontAwesomeIcons.user,
          size: 35.0,
        ),
      ));
    });
  }

  Widget buildReviewList() {
    return ListView.builder(
      itemCount: _reviews.length,
      itemBuilder: (context, index) {
        return buildReviewTile(_reviews[index]);
      },
    );
  }

  Widget buildReviewTile(Review review) {
    return ListTile(
      title: Text(review.body),
      leading: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ClipOval(child: review.profilePic),
        ),
      ),
      subtitle: Text(review.author),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Reviews"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: buildReviewList(),
          ),
          TextField(
            onSubmitted: (String submittedText) {
              newReview(submittedText);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(20.0),
              hintText: "Add a one line review",
            ),
          ),
        ],
      ),
    );
  }
}
