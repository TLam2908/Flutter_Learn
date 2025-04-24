import 'package:flutter/material.dart';
import 'package:flutter_1/controller/post_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_1/screens/post_add.dart';
import 'package:flutter_1/screens/post_detail.dart';

class MessagePage extends StatelessWidget {
  MessagePage({super.key});

  @override
  final PostController pController = Get.put(PostController());

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add new Post",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostAdd(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.add, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () async {
                                pController.getPosts();
                              },
                              icon: Icon(Icons.refresh, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: pController.postList.length,
                    itemBuilder: (BuildContext context, int postIndex) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: ListTile(
                          title: Text(
                            pController.postList[postIndex].title,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.pinkAccent,
                            child: Text(
                              pController.postList[postIndex].id.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => PostDetail(
                                      post: pController.postList[postIndex],
                                    ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
