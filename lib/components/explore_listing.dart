import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_1/interface/listing.dart';
import 'package:flutter_1/interface/host.dart';
import 'package:flutter_1/listing_detail.dart';

final List<Listing> testListings = [
  Listing(
    images: [
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/9ca35122-ed57-46cd-8217-3d834c3082d3.png?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/63b06fcb-e12b-482a-ac95-215c8957ff85.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/78f42453-a14e-4d28-9753-f67e4a45f7be.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/dc8fd0f2-ffc9-4739-a238-7b04f961bff4.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-1236022890675662413/original/1ce02352-7825-47fd-8f89-fc9b30dc7415.jpeg?im_w=720",
    ],
    title: "Stylish Beachfront, Private pool Sunset",
    address: "Ho Chi Minh City, Vietnam",
    price: 67,
    review: 46,
    rating: 4,
    date: "25 - 30 March",
    total: 402,
    isFavorite: false,
    description: "This is a beautiful villa with a private pool, located in the heart of the city. The villa is designed in a modern style, with a large living room, a kitchen, a dining room, and a private pool. The villa is located in a quiet area, close to the beach, and has a beautiful view of the sea. The villa is perfect for a family or a group of friends who want to relax and enjoy the beautiful view of the sea.",
    host: Host(name: "Thanh", reviews: 46, rating: 4.5, time: 10),
  ),
  Listing(
    images: [
      "https://a0.muscache.com/im/pictures/1b04e598-3cb0-4848-ad88-4d353011e7d3.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/96fcee1a-3528-40a1-8317-9a4162d533c5.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/d6e4ca52-52c1-46a3-81ad-1369ac9e0679.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/6f1bb402-fb58-45ff-8356-21b0e5d59630.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/abca973c-7b03-47b0-8972-067d3e445940.jpg?im_w=720",
    ],
    address: "Thalang, Thailand",
    title: "Villa Amylia",
    price: 200,
    review: 12,
    rating: 5,
    date: "26 April - 2 May",
    total: 1200,
    isFavorite: true,
    description: "For those who looking for the villa for the event like wedding, birthday, party etc. please inquire the additional price before you make the booking.",
    host: Host(name: "Amy", reviews: 12, rating: 5, time: 2),
  ),
  Listing(
    images: [
      "https://a0.muscache.com/im/pictures/miso/Hosting-34957013/original/04b83241-77a1-41fe-999a-9686dd15410a.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/ceb422d2-a8ea-4f34-941f-b7feac1a8f5a.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/bdfcd97c-e8ae-4f5b-aeb0-ece29485fd27.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/d2cb5894-2edd-42e6-ad53-081bcb933885.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/35fd8c74-f0a4-4505-aa6d-075598746dcb.jpg?im_w=720",
    ],
    address: "Hakuba, Kitaazumi district, Japan",
    title: "Hakuba Cottage",
    price: 150,
    review: 8,
    rating: 4,
    date: "25 - 30 March",
    total: 750,
    isFavorite: true,
    description: "Brand new and located in Hakuba's premium area of Wadanomori, The Seasons Apartments share the same location as many of Hakuba’s finest accommodation facilities. Just 200 meters from the Happo-one ski lifts and a short stroll from central Happo and the variety of bars, restaurants and hot springs on offer, The Seasons also enjoy a quiet location. Each two-level apartment is designed to maximize guests’ enjoyment, with all bedrooms downstairs and the open-plan living areas maximized upstairs.",
    host: Host(name: "Yuki", reviews: 8, rating: 4, time: 3),
  ),
  Listing(
    images: [
      "https://a0.muscache.com/im/pictures/3494f905-32c6-4994-bd6b-a3e528542c89.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/f828d77c-884c-4278-aa11-d92618731299.jpg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-553748906257446651/original/4865c35f-48cb-4c55-923e-d66816deccdd.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-553748906257446651/original/02577cc3-74a8-49fa-a7df-55173f1b5095.jpeg?im_w=720",
      "https://a0.muscache.com/im/pictures/miso/Hosting-52887036/original/84a15893-5905-4738-b48c-ab30ebe865a7.jpeg?im_w=720",
    ],
    address: "Hakone, Japan",
    title: "Hakone Cottage",
    price: 120,
    review: 6,
    rating: 5,
    date: "13 - 18 July",
    total: 720,
    isFavorite: true,
    description: "The Hakone Cottage is a beautiful and cozy cottage located in the heart of Hakone. The cottage is designed in a traditional Japanese style, with a large living room, a kitchen, a dining room, and a private garden. The cottage is located in a quiet area, close to the Hakone Shrine, and has a beautiful view of the mountains. The cottage is perfect for a family or a group of friends who want to relax and enjoy the beautiful view of the mountains.",
    host: Host(name: "Yuki", reviews: 6, rating: 5, time: 3),
  ),
];

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  List<int> _LikedIndex = List.generate(
    testListings.length,
    (index) => 0,
  ); // _LikedIndex[0] = 1

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
          itemCount: testListings.length,
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
                              ListingDetail(listing: testListings[listIndex]),
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
                            itemCount: testListings[listIndex].images.length,
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
                                      testListings[listIndex]
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
                              visible: testListings[listIndex].isFavorite,
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
                                      _LikedIndex[listIndex] == 0
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
                                  _LikedIndex[listIndex] == 0
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color:
                                      _LikedIndex[listIndex] == 0
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
                                testListings[listIndex].address,
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
                                    "${testListings[listIndex].rating}",
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
                              "\$${testListings[listIndex].price} / night",
                              style: GoogleFonts.lato(
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          Text(
                            testListings[listIndex].date,
                            style: GoogleFonts.lato(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            "Total: \$ ${testListings[listIndex].total}",
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
