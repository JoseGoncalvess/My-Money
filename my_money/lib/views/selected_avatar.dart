import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SelectedAvatr(),
    );
  }
}

class SelectedAvatr extends StatefulWidget {
  const SelectedAvatr({super.key});

  @override
  State<SelectedAvatr> createState() => _SelectedAvatrState();
}

class _SelectedAvatrState extends State<SelectedAvatr> {
  late double altura;
  late double largura;

  bool toquei = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    toquei = !toquei;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInCirc,
                  height: !toquei ? altura = 500 : altura = 100,
                  width: !toquei ? largura = 200 : largura = 100,
                  color: !toquei ? Colors.red : Colors.amber[900],
                  child: Text(toquei ? 'não toquei' : 'tocou agora',
                      style: GoogleFonts.fredoka(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white))),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
