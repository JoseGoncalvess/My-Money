import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevetedbbutomWidget extends StatefulWidget {
  const ElevetedbbutomWidget(
      {super.key,
      required this.largura,
      required this.altura,
      required this.fonte,
      required this.texto,
      this.funcao});
  final double largura;
  final double altura;
  final double? fonte;
  final String texto;
  final primerycolor = const Color(0xFF2E4159);
  final funcao;

  @override
  State<ElevetedbbutomWidget> createState() => _ElevetedbbutomWidgetState();
}

class _ElevetedbbutomWidgetState extends State<ElevetedbbutomWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(widget.largura, widget.altura),
        shape: const StadiumBorder(),
        backgroundColor: widget.primerycolor,
      ),
      child: Text(
        widget.texto,
        style: GoogleFonts.fredoka(
          textStyle: TextStyle(
            fontSize: widget.fonte,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
