import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_1/models/category.dart';

class CategoryListing extends StatefulWidget {
  const CategoryListing({super.key, required this.categoriesData});
  final List<Category> categoriesData;

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
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                // margin: const EdgeInsets.fromLTRB(0, 0, 0, 50), SizedBox o day la border cua Container nen khi margin Container thi no se day vao trong
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
                      widget.categoriesData[index].icon,
                      width: 30,
                      height: 30,
                      color:
                          _selectedIndex == index
                              ? Colors.black
                              : Colors.grey.shade600,
                    ),
                    Text(
                      widget.categoriesData[index].name,
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
          itemCount: widget.categoriesData.length,
        ),
      ),
    );
  }
}
