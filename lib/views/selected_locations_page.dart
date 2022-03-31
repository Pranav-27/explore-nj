// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:explore_nj/views/links_page.dart';
import 'package:explore_nj/views/reviews_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../data_models/location.dart';
import '../data_models/review.dart';
import '../widget_models/heart_animation.dart';

class SelectedLocationPage extends StatefulWidget {
  final Location samplelocation;
  const SelectedLocationPage({Key? key, required this.samplelocation})
      : super(key: key);

  @override
  State<SelectedLocationPage> createState() => _SelectedLocationPageState();
}

class _SelectedLocationPageState extends State<SelectedLocationPage> {
  bool isLiked = false;
  bool isHeartAnimating = false;
  List<String> imageLinks = [];
  List<Review> reviews = [];

  @override
  void initState() {
    super.initState();
    reviews = widget.samplelocation.reviews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Stack(
                children: [
                  Positioned(
                    child: Image.network(
                      widget.samplelocation.imageUrl,
                      fit: BoxFit.cover,
                      height: 250.0,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Positioned.fill(
                    child: Opacity(
                      opacity: isHeartAnimating ? 1 : 0,
                      child: HeartAnimation(
                        isAnimating: isHeartAnimating,
                        child: Icon(Icons.favorite,
                            color: Colors.white, size: 100),
                        onEnd: () {
                          return setState(() {
                            isHeartAnimating = false;
                          });
                        },
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 33, 0, 0),
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.purple,
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 33, 20, 0),
                      child: smallLikeButton(),
                    ),
                    right: 0,
                  ),
                ],
              ),
              onDoubleTap: () {
                setState(() {
                  isLiked = !isLiked;
                  isHeartAnimating = !isHeartAnimating;
                });
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            ListTile(
              title: Text(
                widget.samplelocation.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
              subtitle: Text(
                widget.samplelocation.address,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                widget.samplelocation.description,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            FutureBuilder(
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  //if there is an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error} occured'),
                    );
                  }

                  //if we got data
                  else if (snapshot.hasData) {
                    final data = snapshot.data as List<String>;
                    return Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              width: 150,
                              child: Image.network(
                                data[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              future: fetchImages(widget.samplelocation.name, 25),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  icon: Icon(FontAwesomeIcons.message),
                  label: Text(
                    'Reviews',
                    style: TextStyle(),
                  ),
                  style: TextButton.styleFrom(side: BorderSide()),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewsPage(
                              reviews: widget.samplelocation.reviews)),
                    );
                  },
                ),
            TextButton.icon(
              icon: Icon(FontAwesomeIcons.link),
              label: Text(
                'Links',
                style: TextStyle(),
              ),
              style: TextButton.styleFrom(side: BorderSide()),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LinksPage(
                          location: widget.samplelocation)),
                );
              },
            ),
              ],
            ),
            SizedBox(height: 10.0,),
            
          ],
        ),
      ),
    );
  }

  Widget smallLikeButton() {
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final color = isLiked ? Colors.red : Colors.white;

    return Container(
      child: Row(
        children: [
          HeartAnimation(
            alwaysAnimate: true,
            isAnimating: isLiked,
            child: IconButton(
              icon: Icon(icon, color: color, size: 35),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<String>> fetchImages(String name, int numPics) async {
    var response = await http.get(Uri.parse(
        "https://pranavr.pythonanywhere.com/api?Query=$name,$numPics"));
    List<dynamic> imageUrls;
    if (response.statusCode == 200) {
      imageUrls = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load images');
    }
    List<dynamic> updatedImages = [];
    for (int i = 0; i < imageUrls.length / 2; i++) {
      updatedImages.add(imageUrls[i]);
    }

    return Future.delayed(Duration(milliseconds: 100), (() {
      return updatedImages.cast<String>();
    }));
  }

  Future<List<String>?> fetchUrls(String name, int numLinks) async {
    var response = await http.get(Uri.parse(
        "https://pranavr.pythonanywhere.com/api?Query=$name,$numLinks"));
    List<dynamic> links;
    if (response.statusCode == 200) {
      links = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load links');
    }

    List<dynamic> updatedUrls = [];
    for (int i = links.length ~/ 2; i < links.length; i++) {
      updatedUrls.add(links[i]);
    }
    return Future.delayed(Duration(milliseconds: 100), (() {
      return updatedUrls.cast<String>();
    }));
  }

  Widget HorizontalLocationCard(String url) {
    return Container(
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget ReviewList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          child: ListTile(
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey)),
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ClipOval(child: reviews[index].profilePic),
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            title: Text(
              reviews[index].body,
              style: TextStyle(fontSize: 13.0),
            ),
            subtitle: Text(reviews[index].author),
          ),
        );
      },
    );
  }

  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget enterReview() {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.chat),
        labelText: "Leave a one sentence review",
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            setState(() {
              reviews.insert(0, newReview(controller.text));
            });
          },
          splashColor: Colors.blue,
        ),
      ),
    );
  }

  Review newReview(String text) {
    return Review(
        author: "User",
        body: text,
        profilePic: Icon(
          FontAwesomeIcons.user,
          size: 35.0,
        ));
  }
}
