import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF5F5DA6),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "img/logo.png",
                  height: 90,
                  width: 90,
                ),
                Text('My Money',
                    style: GoogleFonts.fredoka(
                        textStyle: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )))
              ],
            ),
            Container(
              height: 430,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF4F4D8C)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              color: const Color(0xFF8F8EBF),
                              borderRadius: BorderRadius.circular(50)),
                          height: 90,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Foto',
                              style: GoogleFonts.fredoka(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: IconButton(
                          icon: const Icon(Icons.add_a_photo_outlined),
                          onPressed: () {},
                          iconSize: 40,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 300,
                    child: const TextField(),
                  ),
                  Container(
                    width: 200,
                    child: const TextField(),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(240, 80),
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white,
                    ),
                    child: Text('Começar',
                        style: GoogleFonts.fredoka(
                            textStyle: const TextStyle(
                          fontSize: 30,
                          color: Color(0xFF5F5DA6),
                          fontWeight: FontWeight.bold,
                        ))),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
