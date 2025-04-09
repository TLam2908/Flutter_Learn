import 'package:flutter/material.dart';
import 'package:flutter_1/controller/listing_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/components/explore/listing_card.dart';
import 'package:flutter_1/screens/listing_detail.dart';
import '/provider/listing_provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key, this.searchText});

  final String? searchText;

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool _showTotal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    "Your Wishlist listings",
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Consumer<ListingProvider>(
                //   builder: (context, listingProvider, child) {
                //     if (_showTotal != listingProvider.listings.isNotEmpty) {
                //       WidgetsBinding.instance.addPostFrameCallback((_) {
                //         setState(() {
                //           _showTotal = listingProvider.listings.isNotEmpty;
                //         });
                //       });
                //     }
                //     return ListView.builder(
                //       shrinkWrap: true,
                //       physics: NeverScrollableScrollPhysics(),
                //       itemCount: listingProvider.listings.length,
                //       itemBuilder: (BuildContext context, int listIndex) {
                //         return Padding(
                //           padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                //           child: GestureDetector(
                //             onTap: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder:
                //                       (context) => ListingDetail(
                //                         listing:
                //                             listingProvider.listings[listIndex],
                //                       ),
                //                 ),
                //               );
                //             },
                //             child: ListingCard(
                //               listingData: listingProvider.listings[listIndex],
                //               userFavourite:
                //                   listingProvider.userFavorite[listingProvider
                //                       .listings[listIndex]],
                //               quantity:
                //                   listingProvider.quantity[listingProvider
                //                       .listings[listIndex]],
                //             ),
                //           ),
                //         );
                //       },
                //     );
                //   },
                // ), Co
                GetBuilder<ListingController>(
                  builder: (listingController) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: listingController.listings.length,
                      itemBuilder: (BuildContext context, int listIndex) {
                        if (_showTotal !=
                            listingController.listings.isNotEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              _showTotal =
                                  listingController.listings.isNotEmpty;
                            });
                          });
                        }
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ListingDetail(
                                        listing:
                                            listingController
                                                .listings[listIndex],
                                      ),
                                ),
                              );
                            },
                            child: ListingCard(
                              listingData:
                                  listingController.listings[listIndex],
                              userFavourite:
                                  listingController
                                      .userFavorite[listingController
                                      .listings[listIndex]],
                              quantity:
                                  listingController.quantity[listingController
                                      .listings[listIndex]],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                Visibility(
                  visible: _showTotal,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              // Consumer<ListingProvider>(
                              //   builder:
                              //       (context, listingProvider, child) => Text(
                              //         "\$${listingProvider.totalPrice.toStringAsFixed(2)}",
                              //         style: GoogleFonts.lato(
                              //           fontSize: 24,
                              //           fontWeight: FontWeight.bold,
                              //           color: Colors.black,
                              //         ),
                              //       ),
                              // ),
                              GetBuilder<ListingController>(
                                builder:
                                    (listingController) => Text(
                                      "\$${listingController.totalPrice.toStringAsFixed(2)}",
                                      style: GoogleFonts.lato(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Provider.of<ListingProvider>(
                            //   context,
                            //   listen: false,
                            // ).removeAll();
                            Get.find<ListingController>().removeAll();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Clear All',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _showTotal == false,
                  child: Center(
                    child: Text(
                      "No items in your wishlist",
                      style: GoogleFonts.lato(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
