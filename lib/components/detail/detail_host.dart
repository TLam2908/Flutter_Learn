import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_1/models/host.dart';

class DetailHost extends StatelessWidget {
  const DetailHost({super.key, required this.host});

  final Host host;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: double.infinity,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Text(
                "Meet your host",
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                  Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Stack(
                           children: [
                             Container(
                               margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                               width: 100,
                               height: 100,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(50),
                                 image: DecorationImage(
                                   image: NetworkImage(
                                     "https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3485.jpg?w=360",
                                   ),
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ),
                             Positioned(
                               bottom: 5,
                               right: 10,
                               child: Container(
                                 width: 26,
                                 height: 26,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(50),
                                   color: Colors.pink,
                                 ),
                                 child: Image.network(
                                   "https://cdn1.iconfinder.com/data/icons/complete-common-version-4-2/1024/safe8-512.png",
                                   color: Colors.white,
                                 ),
                               ),
                             ),
                           ],
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                           child: Text(
                             host.name,
                             style: GoogleFonts.lato(
                               fontSize: 18,
                               fontWeight: FontWeight.w800,
                             ),
                           ),
                         ),
                         Text(
                           "Superhost",
                           style: GoogleFonts.lato(
                             fontSize: 16,
                             fontWeight: FontWeight.w400,
                             color: Colors.black,
                           ),
                         ),
                       ],
                     ),
                   Container(
                     height: 220,
                     margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "${host.reviews}",
                               style: GoogleFonts.lato(
                                 fontSize: 20,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black,
                               ),
                             ),
                             Text("Reviews", style: GoogleFonts.lato(
                               fontSize: 12,
                               fontWeight: FontWeight.w400,
                               color: Colors.black,
                             ),)
                           ],
                         ),
                         SizedBox(
                           height: 20,
                           width: 150,
                           child: Divider(color: Colors.grey.shade400, thickness: 0.6),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text(
                                   "${host.rating}",
                                   style: GoogleFonts.lato(
                                     fontSize: 20,
                                     fontWeight: FontWeight.w600,
                                     color: Colors.black,
                                   ),
                                 ),
                                 Icon(Icons.star, color: Colors.black, size: 20,),
                               ],
                             ),
                             Text("Rating", style: GoogleFonts.lato(
                               fontSize: 12,
                               fontWeight: FontWeight.w400,
                               color: Colors.black,
                             ),)
                           ],
                         ),
                         SizedBox(
                           height: 20,
                           width: 150,
                           child: Divider(color: Colors.grey.shade400, thickness: 0.6),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text(
                                   "${host.time}",
                                   style: GoogleFonts.lato(
                                     fontSize: 20,
                                     fontWeight: FontWeight.w600,
                                     color: Colors.black,
                                   ),
                                 ),
                               ],
                             ),
                             Text("Months hosting", style: GoogleFonts.lato(
                               fontSize: 12,
                               fontWeight: FontWeight.w400,
                               color: Colors.black,
                             ),)
                           ],
                         ),
                       ],
                     ),
                   ),
                 ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Image.network("https://cdn-icons-png.flaticon.com/128/2831/2831685.png", width: 30, height: 30),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Born in 90s",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Image.network("https://cdn-icons-png.flaticon.com/128/639/639394.png", width: 30, height: 30),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My work: Bussiness owner",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
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
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Image.network("https://cdn-icons-png.flaticon.com/128/2088/2088617.png", width: 30, height: 30),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I spend to much time: My job, travel, motorsport and music",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
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
                  Padding(padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Image.network("https://cdn-icons-png.flaticon.com/128/15609/15609614.png", width: 30, height: 30),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "For guests, I always try to be available to help them with anything they need",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
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
                  Padding(padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Image.network("https://cdn-icons-png.flaticon.com/128/1076/1076877.png", width: 30, height: 30),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I love cat and dog",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
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
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
