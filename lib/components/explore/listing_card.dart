import 'package:flutter/material.dart';
import 'package:flutter_1/provider/listing_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_1/models/listing.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ListingCard extends StatefulWidget {
  const ListingCard({
    super.key,
    required this.listingData,
    this.userFavourite,
    this.quantity,
  });

  final Listing listingData;
  final bool? userFavourite;
  final int? quantity;

  @override
  _ListingCardState createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  // bool isFavorite = false;
  //
  // void _toggleFav() {
  //   setState(() {
  //     isFavorite = !isFavorite;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 270,
              child: Swiper(
                itemCount: widget.listingData.images.length,
                scrollDirection: Axis.horizontal,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.grey,
                  ),
                ),
                control: SwiperControl(color: Colors.white),
                itemBuilder: (BuildContext context, int imageIndex) {
                  return Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.listingData.images[imageIndex],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: widget.listingData.isFavorite,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Loved by guests",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      final tapBar = SnackBar(
                        content: Text(
                          widget.userFavourite == false ||
                                  widget.userFavourite == null
                              ? "Added from favorites"
                              : "Removed to favorites",
                        ),
                        action: SnackBarAction(label: "Undo", onPressed: () {}),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(tapBar);

                      if (widget.userFavourite == false ||
                          widget.userFavourite == null) {
                        Provider.of<ListingProvider>(
                          context,
                          listen: false,
                        ).add(widget.listingData);
                      } else {
                        Provider.of<ListingProvider>(
                          context,
                          listen: false,
                        ).remove(widget.listingData);
                      }
                    },

                    icon: Icon(
                      widget.userFavourite == false ||
                              widget.userFavourite == null
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color:
                          widget.userFavourite == false ||
                                  widget.userFavourite == null
                              ? Colors.white
                              : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.listingData.address,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.black, size: 16),
                      Text(
                        "${widget.listingData.rating}",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  "\$${widget.listingData.price} / night",
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Text(
                widget.listingData.date,
                style: GoogleFonts.lato(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.quantity != null
                        ? "Price Listing: \$${widget.listingData.total * widget.quantity!}"
                        : "Price Listing: \$${widget.listingData.total}",
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Visibility(
                    visible: widget.quantity != null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Quantity: \ ${widget.quantity}",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<ListingProvider>(
                                context,
                                listen: false,
                              ).add(widget.listingData);
                            },
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<ListingProvider>(
                                context,
                                listen: false,
                              ).remove(widget.listingData);
                            },
                            child: Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
