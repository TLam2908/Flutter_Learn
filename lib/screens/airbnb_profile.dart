import 'package:flutter/material.dart';
import 'package:flutter_1/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile Page",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    return Padding(padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${userProvider.user.name}",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            userProvider.user.email.isNotEmpty
                                ? "Email: ${userProvider.user.email}"
                                : "Email: Not provided",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/login");
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/register");
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
