import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/valores/avatar_info.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../valores/user_info.dart';
import 'mypage.dart';
import 'selected_avatar.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    super.key,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  void showdialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF5F5DA6),
          title: const Text('Muito Importante'),
          content: const Text("Todas as Informações estão corretas?"),
          actions: [
            MaterialButton(
              onPressed: () => {
                Navigator.push(context,
                    CupertinoPageRoute(builder: ((context) => const MyPage())))
              },
              child: const Text('Sim!'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ops, Vou Ajustar!'),
            )
          ],
        );
      },
    );
  }

  //controllers
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _patInputController = TextEditingController();

  Future<String> loadPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("foto") ?? "";
  }

  @override
  void initState() {
    super.initState();

    loadPhoto().then((value) {
      // O VALUE É O RETORNO DA FUNÇÃO loadPhoto
      if (value.isNotEmpty) {
        AvatarInfo.retrato = value;
        log('vaziu');
      }
    });

    /*DataUser().loadUserData().then((value) {
      if (value.name.isNotEmpty && value.patrimonio.isNotEmpty) {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: ((context) => MyPage())));
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF5F5DA6),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/logo.png",
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
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF4F4D8C)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(
                                    110,
                                    255,
                                    255,
                                    255,
                                  ),
                                  width: 1,
                                  style: BorderStyle.solid),
                              image: DecorationImage(
                                  image: AssetImage(AvatarInfo.retrato.isEmpty
                                      ? 'assets/img/sem_logo.jpg'
                                      : AvatarInfo.retrato)),
                              color: const Color(0xFF8F8EBF),
                              borderRadius: BorderRadius.circular(100)),
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          const AvatarUser())));
                            }),
                            child: SizedBox(
                              child: Column(
                                children: [
                                  AvatarInfo.retrato.isNotEmpty
                                      ? Container()
                                      : IconButton(
                                          icon: const Icon(
                                            Icons.add_a_photo_outlined,
                                            size: 50,
                                            color: Color(0xFF8F8EBF),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: ((context) =>
                                                        const AvatarUser())));
                                          },
                                          iconSize: 70,
                                        ),
                                  Text(
                                    'Foto',
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF8F8EBF),
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              Text('NOME :',
                                  style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ))),
                              TextField(
                                  controller: _nameInputController,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  keyboardType: TextInputType.name,
                                  cursorColor: const Color(0xFF8F8EBF),
                                  style: const TextStyle(
                                      color: Color(0xFF5F5DA6),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusColor: const Color(0xFF5F5DA6),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintText: "Como devo te Chamar?",
                                    hintStyle: const TextStyle(
                                      color: Color.fromARGB(105, 95, 93, 166),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text('PATRIMÔNIO :',
                                style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ))),
                            SizedBox(
                              width: 180,
                              child: TextField(
                                  controller: _patInputController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  cursorColor: const Color(0xFF8F8EBF),
                                  style: const TextStyle(
                                      color: Color(0xFF5F5DA6),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    hintText: "R\$10,00",
                                    hintStyle: const TextStyle(
                                      color: Color.fromARGB(105, 95, 93, 166),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            UserDatePreference()
                                .saveUserDate(
                                    name: _nameInputController.text,
                                    patrimonio: _patInputController.text)
                                .then((value) {
                              showAnimatedDialog(
                                barrierColor:
                                    const Color.fromARGB(164, 95, 93, 166),
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: const Color(0xFF5F5DA6),
                                    icon: const Icon(
                                      Icons.warning_amber_rounded,
                                      size: 30,
                                    ),
                                    title: const Text(
                                      'Muito Importante',
                                    ),
                                    content: const Text(
                                      "Olá, Seja Muito ebm vindo, antes de seguirmos, todas as Informações estão corretas?",
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () => {
                                          if (_patInputController.text.isEmpty)
                                            {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                backgroundColor: Colors.red,
                                                content: const Text(
                                                  'Digite seus dados antes de seguir!',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                action: SnackBarAction(
                                                    label: 'Ajustar',
                                                    textColor: Colors.white,
                                                    onPressed: () {}),
                                              ))
                                            }
                                          else
                                            {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          const MyPage()))),
                                            }
                                        },
                                        child: const Text(
                                          'Sim!',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ops, Vou Ajustar!'),
                                      )
                                    ],
                                  );
                                },
                                animationType: DialogTransitionType.fade,
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(milliseconds: 400),
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(215, 40),
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            'SALVAR',
                            style: GoogleFonts.fredoka(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                color: Color(0xFF5F5DA6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            log('CANCELOU?');
                            Future.delayed(const Duration(milliseconds: 200))
                                .then((value) => {
                                      DataUser().loadUserData().then((value) {
                                        // O VALUE É O RETORNO DA FUNÇÃO loadPhoto
                                        if (value.patrimonio.isEmpty) {
                                          Navigator.of(context).pop();
                                        } else {
                                          Navigator.of(context).pushReplacement(
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      const MyPage()));
                                        }
                                      })
                                    });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(110, 40),
                            shape: const StadiumBorder(),
                            backgroundColor: const Color(0xFF2E4159),
                          ),
                          child: Text(
                            'CANCELAR',
                            style: GoogleFonts.fredoka(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 280,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Text(
                      "FALTA POUCO PRA VOCÊ FICAR NO CONTROLE DA SUA VIDA FINANCEIRA.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fredoka(
                          textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ))),
                ),
              ],
            ),
          ),
        ));
  }
}
