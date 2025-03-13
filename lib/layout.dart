import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(const MyApp());
}

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
            toolbarHeight: 90,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(widget.title, style: GoogleFonts.lato(
              fontSize: 22,
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
                                    Icon (Icons.arrow_forward_rounded, size: 10,)
                                  ],
                                )
                            )

                          ]
                      )
                  ),
                  ReadMoreText("Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017. Flutter is used internally by Google in apps such as Google Pay and Google Earth as well as other software developers including ByteDance and Alibaba.",
                    trimLines: 4,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(fontSize: 12, color: Colors.blue),
                    lessStyle: TextStyle(fontSize: 12, color: Colors.blue),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 270),
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
