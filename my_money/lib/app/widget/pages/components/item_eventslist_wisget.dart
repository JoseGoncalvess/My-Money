import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemeEventListWidget extends StatefulWidget {
  const ItemeEventListWidget(
      {super.key,
      required this.evento,
      required this.data,
      required this.valor});
  final String evento;
  final String data;
  final double valor;

  @override
  State<ItemeEventListWidget> createState() => _ItemeEventListWidgetState();
}

class _ItemeEventListWidgetState extends State<ItemeEventListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
                color: const Color(0xFF2E4159),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Column(
                      children: [
                        //separo os item atraves do caracter selecionado e pego o item d eum new list atraves do index []
                        Text(widget.data.split('/')[0],
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white))),
                        Text("NOV.",
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white)))
                      ],
                    ),
                  ),
                  Text(widget.evento,
                      style: GoogleFonts.fredoka(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white))),
                  Text(widget.valor.toString(),
                      style: GoogleFonts.fredoka(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
