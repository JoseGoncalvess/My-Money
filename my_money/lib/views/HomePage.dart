import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/valores/cod_Fiture.dart';
import 'package:my_money/views/MyPage.dart';
import 'package:my_money/views/selected_avatar.dart';
import 'package:my_money/views/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/user_info.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//ALERT DIALOG

  UserData _userData = UserData(name: 'name', patrimonio: 'patrimonio');

  void initState() {
    DataUser().loadUserData().then((value) => {
          setState(() {
            _userData = value;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: ((context) => AvatarUser())));
        },
        child: Icon(Icons.account_tree_rounded),
      ),
      //passagem de cor em HexaDecimal.
      backgroundColor: Color(0xFF5F5DA6),
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
                        "img/logo.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Text('My Money',
                        style: GoogleFonts.fredoka(
                            textStyle: const TextStyle(
                          fontSize: 55,
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
                  if (_userData.name != '' && _userData.patrimonio != '') {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const MyPage())));
                  } else {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const UserCard())));
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(240, 80),
                  shape: StadiumBorder(),
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
