import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: GoogleFonts.lato(
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
      body: Padding (
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
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 0.5),
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
            Padding (padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
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
                          borderSide: BorderSide(color: Colors.black, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey.shade200, width: 0.5),
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
            Padding (padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: _nameController,
                      style: GoogleFonts.lato(
                          fontSize: 13,
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
                          borderSide: BorderSide(color: Colors.grey.shade200, width: 0.5),
                        ),
                        hintText: "Name",
                        hintStyle: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade600
                        ),
                      ),
                    )
                )
            ),
            Text("We'll call or text you to confirm your number. Standard message and data rates apply.", style: GoogleFonts.lato(
              fontSize: 12,
              color: Colors.black,
            ),),
            Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        )
                    ),
                    onPressed: () {

                    },
                    child: Text("Register", style: GoogleFonts.lato(
                        color: Colors.white
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