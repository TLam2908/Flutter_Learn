import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_1/screens/airbnb_profile.dart';

class SearchListing extends StatefulWidget {
  const SearchListing({super.key});

  @override
  State<SearchListing> createState() => _SearchListingState();
}

class _SearchListingState extends State<SearchListing> {

  final TextEditingController _searchController = TextEditingController();

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3 ),
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 14, 10, 12),
            child: Row (
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: Icon(Icons.search, size: 30),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.fromLTRB(12, 0, 0, 5),
                      child: Text("Where to?", style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                    SizedBox(
                        height: 20,
                        width: 260,
                        child: TextField(
                          controller: _searchController,
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: "Anywhere . Any week . Add guests",
                            hintStyle: GoogleFonts.lato(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade600
                            ),
                          ),
                        )
                    )
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400, // Border color
                      width: 1, // Border width
                    ),
                    borderRadius: BorderRadius.circular(50), // Border radius for rounded corners
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune),
                    iconSize: 16,
                    onPressed: () {
                      // do something
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}


