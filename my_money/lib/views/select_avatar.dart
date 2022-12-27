import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarSelected extends StatefulWidget {
  const AvatarSelected({super.key});

  @override
  State<AvatarSelected> createState() => _AvatarSelectedState();
}

class _AvatarSelectedState extends State<AvatarSelected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 58, 58),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5DA6),
        centerTitle: true,
        title: Text(
          'Selecione seu Avatar',
          style: GoogleFonts.fredoka(
              textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          )),
        ),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.amber,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
