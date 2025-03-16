import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(const MyApp());
}

List<Object> Article = [
  {
    'title' : 'ReactJS',
    'content' : 'React is an open-source, front end, JavaScript library for building user interfaces or UI components.',
    'image' : 'assets/react.png',
  },
  {
    'title': 'NestJS',
    'content': 'NestJS is a framework for building efficient, scalable Node.js server-side applications.',
    'image': 'assets/nest.png',
  },
  {
    'title' : 'VueJS',
    'content' : 'Vue.js is an open-source model–view–viewmodel front end JavaScript framework.',
    'image' : 'assets/vue.png',
  },
  {
    'title' : 'NextJS',
    'content' : 'Next.js is an open-source React front-end development web framework.',
    'image' : 'assets/nextjs.png',
  },
  {
    'title' : 'Next1',
    'content' : 'Next.js is an open-source React front-end development web framework.',
    'image' : 'assets/nextjs.png',
  },
  {
    'title' : 'Next2',
    'content' : 'Next.js is an open-source React front-end development web framework.',
    'image' : 'assets/nextjs.png',
  }
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(title: "Flutter"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  bool fav = false;
  void _toggleFav () {
    setState(() {
      fav = !fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(widget.title, style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            )),
            leading: (
                IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      print("icon pressed");
                    }
                )
            ),
            actions: <Widget> [
              IconButton (
                icon: Icon(fav ? Icons.favorite : Icons.favorite_border, color: fav ? Colors.red : null),
                  onPressed: () {
                    _toggleFav();
                    final likeBar = SnackBar(
                      content: Text(fav ? 'You liked this article' : 'You unliked this article'),
                      action: SnackBarAction(label: 'Undo', onPressed: () {})
                    );
                    ScaffoldMessenger.of(context).showSnackBar(likeBar);
                  }
              )
            ]
        ),

        body: Container (
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage('assets/flutter_img.png'),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [
                            Text("Welcome to Flutter", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            )),
                            TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  print("button pressed");
                                },
                                child: Row (
                                  children: <Widget> [
                                    Padding(padding: const EdgeInsets.only(right: 5),
                                      child: Text("Read more", style: TextStyle(
                                        fontSize: 12,
                                      )),
                                    ),
                                    Icon (Icons.arrow_forward_rounded, size: 10, )
                                  ],
                                )
                            )

                          ]
                      )
                  ),
                  ReadMoreText("Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017. Flutter is used internally by Google in apps such as Google Pay and Google Earth as well as other software developers including ByteDance and Alibaba.",
                    trimMode: TrimMode.Line,
                    trimLines: 4,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(fontSize: 12, color: Colors.blue),
                    lessStyle: TextStyle(fontSize: 12, color: Colors.blue),
                  ),

                  // Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                  //   child: Text ("Related Articles", style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w900,
                  //   )),
                  // ),

                 // // Dung ListView thi can SizedBox de set chieu cao
                 // SizedBox(
                 //   height: 250,
                 //   child: ListView.separated(
                 //     scrollDirection: Axis.horizontal,
                 //     separatorBuilder: (BuildContext context, int index) {
                 //       return SizedBox(width: 30);
                 //     }, // Space between items
                 //     itemCount: Article.length,
                 //     itemBuilder: (BuildContext context, int index) {
                 //       final article = Article[index] as Map<String, dynamic>;
                 //       return Column (
                 //         crossAxisAlignment: CrossAxisAlignment.start,
                 //         children: [
                 //           ClipRRect(
                 //               borderRadius: BorderRadius.circular(10),
                 //               child: Image(
                 //                 image: AssetImage(article['image']),
                 //                 height: 150,
                 //                 width: 150,
                 //                 fit: BoxFit.contain,
                 //               )
                 //           ),
                 //           Padding (padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                 //             child: Text(article['title'], style: TextStyle(
                 //               fontSize: 12,
                 //               fontWeight: FontWeight.bold,
                 //             )),
                 //           ),
                 //           SizedBox(
                 //             width: 170,
                 //             child: Text (article['content'], style: TextStyle(
                 //               fontSize: 10,
                 //               fontWeight: FontWeight.normal,
                 //             )),
                 //           )
                 //         ],
                 //       );
                 //     },
                 //   ),
                 // ),

                  Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Text("Related Articles", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900
                    ),)
                  ),

                  // Muon ListView khong co scroll thi dung column + shinkWrap + physics
                  Column(
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final article = Article[index] as Map<String, dynamic>;
                            return Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(padding: const EdgeInsets.only(right: 10),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image(
                                              image: AssetImage(article['image']),
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.contain
                                          )
                                      ),
                                    )
                                ),

                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(article['title'], style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900
                                        ),
                                        ),

                                        Padding(padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                          child: Text(
                                            article['content'],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              final tapBar = SnackBar(
                                                content: const Text('Read more'),
                                                action: SnackBarAction(label: "Undo", onPressed: () {}),
                                              );
                                              ScaffoldMessenger.of(context).showSnackBar(tapBar);
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Padding(padding: const EdgeInsets.only(right: 5),
                                                  child: Text("Read more", style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.blue
                                                  )),
                                                ),
                                                Icon (Icons.arrow_forward_rounded, size: 10, color: Colors.blue)
                                              ],
                                            )
                                        )
                                      ],
                                    )
                                )
                              ],
                            );

                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                          itemCount: Article.length
                      )
                    ],
                  ),

                  Padding(padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton (
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Row (
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Read More", style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  )),
                                  Padding(padding: const EdgeInsets.only(left: 5),
                                      child: Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 15)
                                  )
                                ],
                              )

                          )
                      )
                  ),

                ],
              ),
            )
        )
    );
  }
}
