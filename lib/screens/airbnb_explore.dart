import 'package:flutter/material.dart';
import 'package:flutter_1/models/listing.dart';
import 'package:flutter_1/models/host.dart';
import 'package:flutter_1/models/category.dart';
import '../components/explore/explore_search.dart';
import '../components/explore/explore_category.dart';
import '../components/explore/explore_listing.dart';

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

final List<Category> categories = [
  Category(
    name: "Room",
    icon:
    "https://a0.muscache.com/pictures/7630c83f-96a8-4232-9a10-0398661e2e6f.jpg",
  ),
  Category(
    name: "Cabin",
    icon:
    "https://a0.muscache.com/pictures/1b6a8b70-a3b6-48b5-88e1-2243d9172c06.jpg",
  ),
  Category(
    name: "Country",
    icon:
    "https://a0.muscache.com/pictures/6ad4bd95-f086-437d-97e3-14d12155ddfe.jpg",
  ),
  Category(
    name: "Castle",
    icon:
    "https://a0.muscache.com/pictures/1b6a8b70-a3b6-48b5-88e1-2243d9172c06.jpg",
  ),
  Category(
    name: "Hanbok",
    icon:
    "https://a0.muscache.com/pictures/51f5cf64-5821-400c-8033-8a10c7787d69.jpg",
  ),
  Category(
    name: 'Famous',
    icon:
    "https://a0.muscache.com/pictures/ed8b9e47-609b-44c2-9768-33e6a22eccb2.jpg",
  ),
  Category(
    name: "Windmill",
    icon:
    "https://a0.muscache.com/pictures/5cdb8451-8f75-4c5f-a17d-33ee228e3db8.jpg",
  ),
  Category(
    name: "Pool",
    icon:
    "https://a0.muscache.com/pictures/5cdb8451-8f75-4c5f-a17d-33ee228e3db8.jpg",
  ),
  Category(
    name: "Treehouse",
    icon:
    "https://a0.muscache.com/pictures/4d4a4eba-c7e4-43eb-9ce2-95e1d200d10e.jpg",
  ),
  Category(
    name: "Modern",
    icon:
    "https://a0.muscache.com/pictures/50861fca-582c-4bcc-89d3-857fb7ca6528.jpg",
  ),
];

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
                  CategoryListing(categoriesData: categories,),
                  Listings(listingsData: testListings,),
                ]
            ),
          ),
        )
      ),
    );
  }
}