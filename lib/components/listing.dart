import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';

List<Object> listings = [
  {
    "images": [
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/9ca35122-ed57-46cd-8217-3d834c3082d3.png?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/63b06fcb-e12b-482a-ac95-215c8957ff85.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/78f42453-a14e-4d28-9753-f67e4a45f7be.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/dc8fd0f2-ffc9-4739-a238-7b04f961bff4.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/1ce02352-7825-47fd-8f89-fc9b30dc7415.jpeg?im_w=720",
    ],
    "address": "Ho Chi Minh City, Vietnam",
    "price": "67",
    "rating": 4,
    "date": "25 - 30 March",
    "total": 402,
    "isFavorite": false,
  },

  {
    "images": [
      "https://a0.muscache.com/im/pictures/1b04e598-3cb0-4848-ad88-4d353011e7d3.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/96fcee1a-3528-40a1-8317-9a4162d533c5.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/d6e4ca52-52c1-46a3-81ad-1369ac9e0679.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/6f1bb402-fb58-45ff-8356-21b0e5d59630.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/abca973c-7b03-47b0-8972-067d3e445940.jpg?im_w=720",
    ],
    "address": "Thalang, Thailand",
    "price": "200",
    "rating": 5,
    "date": "26 April - 2 May",
    "total": 1200,
    "isFavorite": true,
  },

  {
    "images": [
      "https://a0.muscache.com/im/pictures/miso/Hosting-34957013/original/04b83241-77a1-41fe-999a-9686dd15410a.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/ceb422d2-a8ea-4f34-941f-b7feac1a8f5a.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/bdfcd97c-e8ae-4f5b-aeb0-ece29485fd27.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/d2cb5894-2edd-42e6-ad53-081bcb933885.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/35fd8c74-f0a4-4505-aa6d-075598746dcb.jpg?im_w=720",
    ],
    "address": "Hakuba, Kitaazumi district, Japan",
    "price": "150",
    "rating": 4,
    "date": "25 - 30 March",
    "total": 750,
    "isFavorite": true,
  },

  {
    "images": [
      "https://a0.muscache.com/im/pictures/3494f905-32c6-4994-bd6b-a3e528542c89.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/f828d77c-884c-4278-aa11-d92618731299.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-553748906257446651/original/4865c35f-48cb-4c55-923e-d66816deccdd.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-553748906257446651/original/02577cc3-74a8-49fa-a7df-55173f1b5095.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-52887036/original/84a15893-5905-4738-b48c-ab30ebe865a7.jpeg?im_w=720",
    ],
    "address": "Hakone, Japan",
    "price": "120",
    "rating": 5,
    "date": "13 - 18 July",
    "total": 720,
    "isFavorite": true,
  },
];

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  List<int> _LikedIndex = List.generate(listings.length, (index) => 0);

  void _toggleFav(int index) {
    setState(() {
      if (_LikedIndex[index] == 0) {
        _LikedIndex[index] = 1;
      } else {
        _LikedIndex[index] = 0;
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
          itemCount: listings.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final listing = listings[index] as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 270,
                        child: Swiper(
                          itemCount: listing["images"].length,
                          scrollDirection: Axis.horizontal,
                          pagination: SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.grey,
                            ),
                          ),
                          control: SwiperControl(color: Colors.white),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(listing["images"][index]),
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
                            visible: listing["isFavorite"],
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
                                _toggleFav(index);
                                final tapBar = SnackBar(
                                  content: Text(
                                    _LikedIndex[index] == 0
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
                                _LikedIndex[index] == 0
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color:
                                    _LikedIndex[index] == 0
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
                              listing["address"],
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
                                  "${listing["rating"]}",
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
                        Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text("\$${listing["price"]} / night", style: GoogleFonts.lato(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600,
                            ),)
                        ),
                        Text(
                          listing["date"],
                          style: GoogleFonts.lato(
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          "Total: \$ ${listing["total"]}",
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
            );
          },
        ),
      ),
    );
  }
}
