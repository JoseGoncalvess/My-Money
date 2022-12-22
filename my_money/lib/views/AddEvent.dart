import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //importante para teclado que transborda
      resizeToAvoidBottomInset: false,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Novas Dispesas',
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ))),
                        Image.asset(
                          "img/logo.png",
                          height: 70,
                          width: 70,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 699,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Detalhes da dispesa',
                          style: GoogleFonts.fredoka(
                              textStyle: const TextStyle(
                            fontSize: 35,
                            color: Color(0xFF5F5DA6),
                            fontWeight: FontWeight.bold,
                          ))),
                    ),
                    Text("Nome do Evento",
                        style: GoogleFonts.fredoka(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF2E4159),
                          fontWeight: FontWeight.bold,
                        ))),
                    SizedBox(
                      width: 360,
                      height: 90,
                      child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF8F8EBF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Ex: Churrasco em Família",
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              labelText: 'Ex: Churrasco em Família',
                              labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                              disabledBorder: InputBorder.none)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Data:",
                                style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF2E4159),
                                  fontWeight: FontWeight.bold,
                                ))),
                            SizedBox(
                              width: 150,
                              height: 90,
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF8F8EBF),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.center,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Ex: Churrasco em Família",
                                      hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Ex: Churrasco em Família',
                                      labelStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                      disabledBorder: InputBorder.none)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text("Gastou:",
                                style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF2E4159),
                                  fontWeight: FontWeight.bold,
                                ))),
                            SizedBox(
                              width: 150,
                              height: 90,
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF8F8EBF),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.center,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Ex: Churrasco em Família",
                                      hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Ex: Churrasco em Família',
                                      labelStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                      disabledBorder: InputBorder.none)),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("Alimentação",
                          style: GoogleFonts.fredoka(
                              textStyle: const TextStyle(
                            fontSize: 30,
                            color: Color(0xFF2E4159),
                            fontWeight: FontWeight.bold,
                          ))),
                    ),

                    ///Categorias da dispesa
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5F5DA6),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(Icons.medical_services_rounded),
                                ),
                                Text("saúde",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF2E4159),
                                      fontWeight: FontWeight.bold,
                                    ))),
                              ],
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5F5DA6),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Text("Tag:",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF2E4159),
                                      fontWeight: FontWeight.bold,
                                    ))),
                              ],
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5F5DA6),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Text("Tag:",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF2E4159),
                                      fontWeight: FontWeight.bold,
                                    ))),
                              ],
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5F5DA6),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Text("Tag:",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF2E4159),
                                      fontWeight: FontWeight.bold,
                                    ))),
                              ],
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5F5DA6),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Text("Tag:",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF2E4159),
                                      fontWeight: FontWeight.bold,
                                    ))),
                              ],
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5F5DA6),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Text("Tag:",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF2E4159),
                                      fontWeight: FontWeight.bold,
                                    ))),
                              ],
                            ))
                          ],
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
