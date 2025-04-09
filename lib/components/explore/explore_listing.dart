import 'package:flutter/material.dart';
import 'package:flutter_1/controller/listing_controller.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_1/provider/listing_provider.dart';
import 'package:flutter_1/models/listing.dart';
import 'package:flutter_1/screens/listing_detail.dart';
import 'package:flutter_1/components/explore/listing_card.dart';

class Listings extends StatefulWidget {
  const Listings({super.key, required this.listingsData});

  final List<Listing> listingsData;

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.listingsData.length,
        // scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int listIndex) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ListingDetail(
                          listing: widget.listingsData[listIndex],
                        ),
                  ),
                );
              },
              // child: Consumer<ListingProvider>(
              //   builder:
              //       (context, listingProvider, child) => ListingCard(
              //         listingData: widget.listingsData[listIndex],
              //         userFavourite: listingProvider.userFavorite[widget.listingsData[listIndex]],
              //       ),
              // ),
              child: GetBuilder<ListingController>(
                builder: (listingController) {
                  return ListingCard(
                    listingData: widget.listingsData[listIndex],
                    userFavourite:
                        listingController.userFavorite[widget
                            .listingsData[listIndex]],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
