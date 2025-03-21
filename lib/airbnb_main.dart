import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'airbnb_explore.dart';

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
      title: 'Airbnb Clone',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> page = [];

  @override
  void initState() {
    page = [
      const ExplorePage(),
      const ExplorePage(),
      const ExplorePage(),
      const ExplorePage(),
      const ExplorePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.white,
         selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.black,
         selectedLabelStyle: TextStyle(
           fontSize: 12,
           fontWeight: FontWeight.bold,
         ),
         unselectedLabelStyle: TextStyle(
           fontSize: 12,
           fontWeight: FontWeight.bold,
         ),
         iconSize: 30,
         // elevation: 5,
         type: BottomNavigationBarType.fixed,
         currentIndex: _selectedIndex,
         onTap: (int index) {
           setState(() {
              _selectedIndex = index;
           });
         },
         items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
           BottomNavigationBarItem(icon: Image.asset("assets/airbnb.png", height: 28, color: _selectedIndex == 2 ? Colors.pinkAccent : Colors.black), label: 'Trips'),
           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Message'),
           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
         ]
     ),
     body: SafeArea(child: page[_selectedIndex])
   );
  }
}


