import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Object> categories = [
  {
    "name": "Room",
    "icon":
        "https://a0.muscache.com/pictures/7630c83f-96a8-4232-9a10-0398661e2e6f.jpg",
  },
  {
    "name": "Cabin",
    "icon":
        "https://a0.muscache.com/pictures/1b6a8b70-a3b6-48b5-88e1-2243d9172c06.jpg",
  },
  {
    "name": "Country",
    "icon":
        "https://a0.muscache.com/pictures/6ad4bd95-f086-437d-97e3-14d12155ddfe.jpg",
  },
  {
    "name": "Castle",
    "icon":
        "https://a0.muscache.com/pictures/1b6a8b70-a3b6-48b5-88e1-2243d9172c06.jpg",
  },
  {
    "name": "Hanbok",
    "icon":
        "https://a0.muscache.com/pictures/51f5cf64-5821-400c-8033-8a10c7787d69.jpg",
  },
  {
    "name": 'Famous',
    "icon":
        "https://a0.muscache.com/pictures/ed8b9e47-609b-44c2-9768-33e6a22eccb2.jpg",
  },
  {
    "name": "Windmill",
    "icon":
        "https://a0.muscache.com/pictures/5cdb8451-8f75-4c5f-a17d-33ee228e3db8.jpg",
  },
  {
    "name": "Pool",
    "icon":
        "https://a0.muscache.com/pictures/5cdb8451-8f75-4c5f-a17d-33ee228e3db8.jpg",
  },
  {
    "name": "Treehouse",
    "icon":
        "https://a0.muscache.com/pictures/4d4a4eba-c7e4-43eb-9ce2-95e1d200d10e.jpg",
  },
  {
    "name": "Modern",
    "icon":
        "https://a0.muscache.com/pictures/50861fca-582c-4bcc-89d3-857fb7ca6528.jpg",
  },
];

class CategoryListing extends StatefulWidget {
  const CategoryListing({super.key});

  @override
  State<CategoryListing> createState() => _CategoryListingState();
}

class _CategoryListingState extends State<CategoryListing> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final category = categories[index] as Map<String, dynamic>;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                // margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:
                          _selectedIndex == index
                              ? Colors.black
                              : Colors.transparent,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      category["icon"],
                      width: 30,
                      height: 30,
                      color:
                          _selectedIndex == index
                              ? Colors.black
                              : Colors.grey.shade600,
                    ),
                    Text(
                      category["name"],
                      style: GoogleFonts.lato(
                        color:
                            _selectedIndex == index
                                ? Colors.black
                                : Colors.grey.shade600,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder:
              (BuildContext context, int index) => const SizedBox(width: 35),
          itemCount: categories.length,
        ),
      ),
    );
  }
}
