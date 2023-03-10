import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/valores/user_info.dart';

class ConfigApp extends StatefulWidget {
  const ConfigApp({Key? key}) : super(key: key);

  @override
  State<ConfigApp> createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color(0xFF494F56)),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xFF5F5DA6),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.10,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_rounded)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text('Configurações',
                          style: GoogleFonts.fredoka(
                              textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                    'Olá ${DataUser.userData.name}, escolha a suas configurações',
                    style: GoogleFonts.fredoka(
                        textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ))),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Tema',
                        style: GoogleFonts.fredoka(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 100,
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.light_mode_rounded)),
                          Text('Ligth Modo',
                              style: GoogleFonts.fredoka(
                                  textStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 100,
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                log('BRASIL PORRA!!');
                              },
                              icon: const Icon(Icons.dark_mode_rounded)),
                          Text('Dark Modo',
                              style: GoogleFonts.fredoka(
                                  textStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text('Linguagem',
                      style: GoogleFonts.fredoka(
                          textStyle: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ))),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        log('BRASIL PORRA!!');
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/img/br.png')),
                                  borderRadius: BorderRadius.circular(22)),
                            ),
                            Text('PT-BR',
                                style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                )))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        log('XIAOMI MELHOR QUE IPHONE');
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/img/us.png')),
                                  borderRadius: BorderRadius.circular(22)),
                            ),
                            Text('EN-US',
                                style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                )))
                          ],
                        ),
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
