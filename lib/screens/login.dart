import 'package:flutter/material.dart';
import 'package:flutter_1/models/user.dart';
import 'package:flutter_1/provider/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/api/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationApi _authenticationApi = AuthenticationApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in', style: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),),
        centerTitle: true,
        leading: (
            IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                }
            )
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 50,
                width: double.infinity,
                child: TextField(
                  controller: _emailController,
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Colors.grey.shade200, width: 0.5),
                    ),
                    hintText: "Email",
                    hintStyle: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600
                    ),
                  ),
                )
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    child: TextField(
                      controller: _passwordController,
                      style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.black, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 0.5),
                        ),
                        hintText: "Password",
                        hintStyle: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade600
                        ),
                      ),
                    )
                )
            ),
            Text(
              "We'll call or text you to confirm your number. Standard message and data rates apply.",
              style: GoogleFonts.lato(
                fontSize: 12,
                color: Colors.black,
              ),),
            Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        )
                    ),
                    onPressed: () async {
                      try {
                        final user = await Provider.of<UserProvider>(context, listen: false)
                            .loginAndSetUser(
                            _emailController.text, _passwordController.text);
                        if (user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Login successful",
                                      style: GoogleFonts.lato(
                                          color: Colors.white
                                      )
                                  ),
                                  backgroundColor: Colors.green
                              )
                          );
                          Navigator.of(context).pushReplacementNamed("/");
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Login failed: $e",
                                    style: GoogleFonts.lato(
                                        color: Colors.white
                                    )
                                ),
                                backgroundColor: Colors.red
                            )
                        );
                      }
                    },
                    child: Text("Log in", style: GoogleFonts.lato(
                        color: Colors.white
                    ),),
                  ),
                )
            ),
            SizedBox(
              height: 60,
              child: Divider(color: Colors.grey.shade400, thickness: 1),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        )
                    ),
                    onPressed: () {

                    },
                    child: Text("Continue with Apple", style: GoogleFonts.lato(
                        color: Colors.black
                    ),),
                  ),
                )
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        )
                    ),
                    onPressed: () {

                    },
                    child: Text("Continue with Google", style: GoogleFonts.lato(
                        color: Colors.black
                    ),),
                  ),
                )
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        )
                    ),
                    onPressed: () {

                    },
                    child: Text(
                      "Continue with Facebook", style: GoogleFonts.lato(
                        color: Colors.black
                    ),),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}