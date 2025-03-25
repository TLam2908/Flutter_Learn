import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: const MyHomePage(title: 'Country Detail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 90,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        )),

        actions: <Widget>[
          IconButton (
            icon: const Icon(Icons.search),
            onPressed: () {
              // do something
            },
          ),
          IconButton (
            icon: const Icon(Icons.drag_indicator_rounded),
            onPressed: () {
              // do something
            },
          )
        ],
        leading: IconButton (
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            // do something
          },
        ),

      ),
      body: Container (
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        // padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Text("France", style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              )),
            Padding (padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
              child: Text("France, officially the French Republic, is a country located primarily in Western Europe. Its overseas regions and territories include French Guiana in South America, Saint Pierre and Miquelon in the North Atlantic."),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      image: AssetImage('assets/france.jpg'),
                      height: 250,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text("Eiffel Tower", style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  Text("Symbol of Paris", style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  )),
                ],
              ),
            ),
           Padding(padding: const EdgeInsets.only(top: 190),
            child:  SizedBox(
             width: double.infinity,
             child: TextButton(
               style: TextButton.styleFrom(
                 foregroundColor: Colors.white,
                 backgroundColor: Colors.blue,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
               ),
               onPressed: () {
                 // do something
               },
               child: Row (
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget> [
                    Text("Learn More", style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    )),
                   Padding(padding: const EdgeInsets.only(left: 5),
                    child: Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 15)
                   )
                 ]
               )
             ),
           )
           )
          ],
        )
      ),
    );
  }
}

