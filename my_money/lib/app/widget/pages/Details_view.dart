import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({super.key});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xFF5F5DA6),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Seu Mês em Detalhes',
                        style: GoogleFonts.fredoka(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.white))),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('Mês',
                                  style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.white))),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.arrow_circle_left_rounded)),
                                  Text('Novembro',
                                      style: GoogleFonts.fredoka(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.white))),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.arrow_circle_right_rounded)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15,
                                                      color: Colors.white))),
                                          Text("NOV.",
                                              style: GoogleFonts.fredoka(
                                                  textStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15,
                                                      color: Colors.white)))
                                        ],
                                      ),
                                    ),
                                    Text('Olokinho',
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Colors.white))),
                                    Text('R\$ ' "50,00",
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
                    }),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF2E4159),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}
