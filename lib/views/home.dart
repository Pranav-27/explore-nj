// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:explore_nj/views/profile.dart';
import 'package:explore_nj/views/selected_locations_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data_models/location.dart';
import '../services/utils.dart';
import '../widget_models/location_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Location> locations = Utils.getLocations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          children: [
            Text("Sample"),
            Text("sample"),
            Text("sampleee"),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 4.0,
        title: const Text(
          "NJ Locations",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: DataSearch(locations: locations));
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              signOut();
            },
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Locations listed below',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 100),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: locations.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return locationCard(locations[index], index, context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  final List<Location> locations;
  List<String> searchResults = [];

  DataSearch({required this.locations});

  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            return close(context, null);
          } else {
            query = "";
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        return close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchResults = [];
    for (Location l in locations) {
      searchResults.add(l.name);
    }

    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    int selectedIndex = 0;
    for (int i = 0; i < locations.length; i++) {
      if (locations[i].name == query) {
        selectedIndex = i;
      }
    }
    return SelectedLocationPage(
      samplelocation: locations[selectedIndex],
    );
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
