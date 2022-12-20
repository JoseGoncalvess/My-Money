import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  void _showdialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF5F5DA6),
          title: const Text('Muito Importante'),
          content: const Text("Todas as Informações estão corretas?"),
          actions: [
            MaterialButton(
              onPressed: () {},
              child: const Text('Sim!'),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text('Ops, Vou Ajustar!'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF5F5DA6),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF4F4D8C)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                            height: 150,
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                'Foto',
                                style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: IconButton(
                            icon: const Icon(Icons.add_a_photo_outlined),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 70,
                          ),
                        ),
                      ],
                    ),
                    Text('NOME',
                        style: GoogleFonts.fredoka(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
                    SizedBox(
                      width: 300,
                      child: TextField(
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: const Color(0xFF5F5DA6),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Como devo te Chamar?",
                              hintStyle: const TextStyle(
                                color: Color(0xFF5F5DA6),
                                fontWeight: FontWeight.bold,
                              ),
                              labelText: 'Como devo te Chamar?',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF5F5DA6),
                                  fontWeight: FontWeight.bold))),
                    ),
                    Text('PATRIMÔNIO',
                        style: GoogleFonts.fredoka(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
                    SizedBox(
                      width: 180,
                      child: TextField(
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Seu patrimônio',
                              hintStyle: const TextStyle(
                                color: Color(0xFF5F5DA6),
                                fontWeight: FontWeight.bold,
                              ),
                              labelText: 'Seu patrimonio',
                              labelStyle: const TextStyle(
                                color: Color(0xFF5F5DA6),
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                    ElevatedButton(
                      onPressed: () => _showdialog(context),
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
        ));
  }
}
