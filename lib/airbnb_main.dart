import 'package:flutter/material.dart';
import 'package:flutter_1/screens/airbnb_message.dart';
import 'package:get/get.dart';
import 'package:flutter_1/controller/listing_controller.dart';
import 'package:flutter_1/controller/register_controller.dart';
import 'package:flutter_1/provider/listing_provider.dart';
import 'package:flutter_1/provider/user_provider.dart';
import 'package:flutter_1/route_generator.dart';
import 'package:provider/provider.dart';
import 'screens/airbnb_wishlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/airbnb_trips.dart';
import 'screens/airbnb_explore.dart';
import 'screens/airbnb_profile.dart';
import 'models/user.dart';

void main() {
  Get.put(ListingController());
  Get.put(RegisterController());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListingProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider(User(
          id: 0,
          name: 'Guest',
          email: '',
          password: '',
        ))),
      ],
      child: const MyApp(), // Specify the child widget here
    ),
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      home: const MainPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
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
      const ExplorePage(), // index = 0
      const WishlistPage(), // index = 1
      const TripsPage(),
      MessagePage(),
      const ProfilePage(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/airbnb.png",
              height: 28,
              color: _selectedIndex == 2 ? Colors.pinkAccent : Colors.black,
            ),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Message',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(child: page[_selectedIndex]),
    );
  }
}
