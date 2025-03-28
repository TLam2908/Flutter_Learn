import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About this place',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          ReadMoreText(
            description,
            trimLines: 4,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
          ),
          SizedBox(
            height: 70,
            child: Divider(color: Colors.grey.shade400, thickness: 0.5),
          ),
          Text(
            'What this place offers',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.wifi, color: Colors.black),
                    const SizedBox(width: 10),
                    Text(
                      'Wi-Fi',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.local_parking, color: Colors.black),
                    const SizedBox(width: 10),
                    Text(
                      'Car Parking',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.pool, color: Colors.black),
                    const SizedBox(width: 10),
                    Text(
                      'Pool',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.ac_unit, color: Colors.black),
                    const SizedBox(width: 10),
                    Text(
                      'Air conditioning',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text("Show all 6 amenities", style: GoogleFonts.lato(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 70,
            child: Divider(color: Colors.grey.shade400, thickness: 0.5),
          ),
        ],
      ),
    );
  }
}
