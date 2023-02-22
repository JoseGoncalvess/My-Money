import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Alerta extends StatefulWidget {
  const Alerta({Key? key}) : super(key: key);

  @override
  State<Alerta> createState() => _AlertaState();
}

class _AlertaState extends State<Alerta> {
  int indexAlert = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Alerta:",
            style: GoogleFonts.fredoka(
                textStyle: const TextStyle(
              fontSize: 20,
              color: Color(0xFF2E4159),
              fontWeight: FontWeight.bold,
            ))),
        IconButton(
          onPressed: () {
            setState(() {
              indexAlert = 1;
            });
          },
          icon: Icon(
            Icons.notifications_rounded,
            size: 20,
            color: indexAlert == 1
                ? const Color(0xFF2E4159)
                : const Color(0xFF5F5DA6),
          ),
        ),
        Container(
          child: IconButton(
            onPressed: () {
              setState(() {
                indexAlert = 2;
              });
            },
            icon: Icon(
              Icons.notifications_active_rounded,
              size: 20,
              color: indexAlert == 2
                  ? const Color(0xFF2E4159)
                  : const Color(0xFF5F5DA6),
            ),
          ),
        )
      ],
    );
  }
}
