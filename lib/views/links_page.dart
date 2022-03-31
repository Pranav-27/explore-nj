import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data_models/location.dart';

class LinksPage extends StatefulWidget {
  const LinksPage({Key? key, required this.location}) : super(key: key);
  final Location location;

  @override
  State<LinksPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Links"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
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
                  height: MediaQuery. of(context). size. height,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(child: InkWell(child: Text(data[index]),
                      onTap: () => launch(data[index]),));
                    },
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: fetchUrls(widget.location.name, 25),
        ),
      ),
    );
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
    return Future.delayed(const Duration(milliseconds: 100), (() {
      return updatedUrls.cast<String>();
    }));
  }
}
