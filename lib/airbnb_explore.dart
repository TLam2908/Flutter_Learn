import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/search.dart';
import 'components/category.dart';
import 'components/listing.dart';

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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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