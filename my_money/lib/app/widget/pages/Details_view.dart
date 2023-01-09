import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/valores/avatar_info.dart';

import '../../../views/AddEvent.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({super.key});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Seu Mês em detalhes'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 1),
                      child: Column(
                        children: [
                          Container(
                            height: 105,
                            color: const Color(0xFF2E4159),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Column(
                                    children: [
                                      Text("20",
                                          style: GoogleFonts.fredoka(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  color: Colors.white))),
                                      Text("NOV.",
                                          style: GoogleFonts.fredoka(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  color: Colors.white)))
                                    ],
                                  ),
                                ),
                                Text('Olokinho',
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Colors.white))),
                                Text('R\$ ' "50,00",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )))
                              ],
                            ),
                          ),
                          Container(
                            height: 1.5,
                            color: Colors.white,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                      color: Color(0xFF5F5DA6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Total pago',
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))),
                        Text('R\$ ' "50,00",
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))),
                      ],
                    ),
                  ),
                  Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.20,
                      decoration:
                          const BoxDecoration(color: Color(0xFF2E4159))),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                      color: Color(0xFF5F5DA6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Saldo Livre',
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))),
                        Text("R\$ " "200,00",
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            )))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
