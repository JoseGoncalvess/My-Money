import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/user_info.dart';
import 'package:my_money/views/MyPage.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  //controllers
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _patInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF5F5DA6),
        body: SingleChildScrollView(
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
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xFF8F8EBF),
                            borderRadius: BorderRadius.circular(100)),
                        height: 110,
                        width: 110,
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.add_a_photo_outlined,
                                size: 50,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 70,
                            ),
                            Text(
                              'Foto',
                              style: GoogleFonts.fredoka(
                                  textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ],
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
                                      borderRadius: BorderRadius.circular(20)),
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
                        onPressed: () => {
                          //_showdialog(context)
                          showAnimatedDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Color.fromARGB(147, 95, 93, 166),
                            builder: (BuildContext context) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                backgroundColor: const Color(0xFF5F5DA6),
                                title: const Text('Muito Importante'),
                                content: const Text(
                                  "Olá,Seja muito bem vindo, antes de continuar, todas as Informações estão corretas?",
                                  textAlign: TextAlign.center,
                                ),
                                icon: const Icon(
                                  Icons.warning_amber_rounded,
                                  size: 30,
                                ),
                                actions: [
                                  MaterialButton(
                                    onPressed: () => {
                                      UserDatePreference().saveUserDate(
                                          _nameInputController.text,
                                          _patInputController.text),
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: ((context) =>
                                                  const MyPage())))
                                    },
                                    child: const Text('Sim!'),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'Cancel');
                                    },
                                    child: const Text('Ops, Vou Ajustar!'),
                                  )
                                ],
                              );
                            },
                            duration: const Duration(milliseconds: 800),
                            animationType: DialogTransitionType.fadeScale,
                          )
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(215, 40),
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.white,
                        ),
                        child: Text('SALVAR',
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
        ));
  }
}
