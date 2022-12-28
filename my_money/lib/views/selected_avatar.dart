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

  bool toqueii = false;
  bool _toquei = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5DA6),
        title: Center(
          child: Text('Selecione seu avatar',
              style: GoogleFonts.fredoka(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.white))),
        ),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            )
          ],
        )),
      ),
    );
  }
}
