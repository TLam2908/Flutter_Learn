import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_1/models/listing.dart';
import 'package:flutter_1/screens/listing_detail.dart';

class Listings extends StatefulWidget {
  const Listings({super.key, required this.listingsData});
  final List<Listing> listingsData;

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  late List<int> _likedIndex;

  @override
  void initState() {
    _likedIndex = List.generate(
      widget.listingsData.length,
      (index) => 0,
    );
    super.initState();
  }

  void _toggleFav(int index) {
    setState(() {
      if (_likedIndex[index] == 0) {
        _likedIndex[index] = 1;
      } else {
        _likedIndex[index] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: SizedBox(
        height: 580,
        child: ListView.builder(
          itemCount: widget.listingsData.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int listIndex) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              ListingDetail(listing: widget.listingsData[listIndex]),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 270,
                          child: Swiper(
                            itemCount: widget.listingsData[listIndex].images.length,
                            scrollDirection: Axis.horizontal,
                            pagination: SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.white,
                                activeColor: Colors.grey,
                              ),
                            ),
                            control: SwiperControl(color: Colors.white),
                            itemBuilder: (
                              BuildContext context,
                              int imageIndex,
                            ) {
                              return Container(
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      widget.listingsData[listIndex]
                                          .images[imageIndex],
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
                              visible: widget.listingsData[listIndex].isFavorite,
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
                                  _toggleFav(listIndex);
                                  final tapBar = SnackBar(
                                    content: Text(
                                      _likedIndex[listIndex] == 0
                                          ? "Removed from favorites"
                                          : "Added to favorites",
                                    ),
                                    action: SnackBarAction(
                                      label: "Undo",
                                      onPressed: () {},
                                    ),
                                  );
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(tapBar);
                                },
                                icon: Icon(
                                  _likedIndex[listIndex] == 0
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color:
                                      _likedIndex[listIndex] == 0
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
                                widget.listingsData[listIndex].address,
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    "${widget.listingsData[listIndex].rating}",
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
                              "\$${widget.listingsData[listIndex].price} / night",
                              style: GoogleFonts.lato(
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          Text(
                            widget.listingsData[listIndex].date,
                            style: GoogleFonts.lato(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            "Total: \$ ${widget.listingsData[listIndex].total}",
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
