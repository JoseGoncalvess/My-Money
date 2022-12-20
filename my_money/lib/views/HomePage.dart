import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//ALERT DIALOG
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
                          textStyle: TextStyle(
                        fontSize: 55,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => _showdialog(context),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 80),
                shape: StadiumBorder(),
                backgroundColor: Colors.white,
              ),
              child: Text('Começar',
                  style: GoogleFonts.fredoka(
                      textStyle: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF5F5DA6),
                    fontWeight: FontWeight.bold,
                  ))),
            ),
            Text(
              'Você no controle do seu Dinheiro!',
              style: GoogleFonts.fredoka(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
            )
          ],
        ),
      ),
    );
  }
}
