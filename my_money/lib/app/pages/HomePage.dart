import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../valores/user_info.dart';
import 'mypage.dart';
import 'user.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//ALERT DIALOG
  UserData _userData = UserData(
    name: 'name',
    patrimonio: 'patrimonio',
  );

  @override
  void initState() {
    super.initState();
    DataUser().loadUserData().then((value) => {
          setState(() {
            _userData = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //passagem de cor em HexaDecimal.
      backgroundColor: const Color(0xFF5F5DA6),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "assets/img/logo.png",
                        height:
                            (MediaQuery.of(context).size.height * 0.40) - 100,
                        width:
                            (MediaQuery.of(context).size.height * 0.40) - 100,
                      ),
                    ),
                    Text('My Money',
                        style: GoogleFonts.fredoka(
                            textStyle: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  if (_userData.name.isEmpty & _userData.patrimonio.isEmpty) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const UserCard())));
                  } else {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const MyPage())));
                  }
                },
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
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Text(
                'Você no controle do seu Dinheiro!',
                style: GoogleFonts.fredoka(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
