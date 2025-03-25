import 'package:flutter/material.dart';
import 'components/explore_search.dart';
import 'components/explore_category.dart';
import 'components/explore_listing.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
                children: [
                  SearchListing(),
                  CategoryListing(),
                  Listings(),
                ]
            ),
          ),
        )
      ),
    );
  }
}