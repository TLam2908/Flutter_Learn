import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'interface/listing.dart';
import 'components/detail_image.dart';
import 'components/detail_content.dart';
import 'components/detail_host.dart';
import 'components/detail_description.dart';
import 'components/detail_map.dart';
import 'components/detail_footer.dart';

class ListingDetail extends StatelessWidget {
  const ListingDetail({super.key, required this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailImage(images: listing.images),
              DetailContext(
                title: listing.title,
                address: listing.address,
                review: listing.review,
                price: listing.price,
                rating: listing.rating,
                date: listing.date,
                total: listing.total,
                host: listing.host
              ),
              DetailHost(host: listing.host),
              DetailDescription(description: listing.description),
              DetailMap(address: listing.address),
              DetailFooter(price: listing.price),
            ],
          ),
        ),
      ),
    );
  }
}
