import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/user_info.dart';
import 'package:my_money/views/AddEvent.dart';
import 'package:my_money/views/HomePage.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final List<String> listName = <String>[
    "Churras- Arena vip",
    "Casamento ",
    "Curso",
    "Faculdade",
    "Confra Work",
    "Celular",
    "Cartão Nubank"
  ];

  UserData _userData = UserData(name: 'name', patrimonio: 'patrimonio');

  @override
  void initState() {
    super.initState();

    DataUser().loadUserData().then((value) => {
          setState(() {
            _userData = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E4159),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 256,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xFF5F5DA6),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 62,
                                    height: 62,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/img/cap.png",
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Perfil",
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 8,
                                                color: Colors.white))),
                                    Text(_userData.name,
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25,
                                                color: Colors.white)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Saldo em conta",
                                  style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white))),
                              Container(
                                alignment: Alignment.center,
                                width: 140,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text('R\$ ' + _userData.patrimonio,
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Color(0xFF5F5DA6)))),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.wallet,
                                  size: 50,
                                ),
                                Column(
                                  children: [
                                    Text("Ultima fatura",
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: Colors.white))),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text('R\$ ' "500,00",
                                          style: GoogleFonts.fredoka(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  color: Color(0xFF5F5DA6)))),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.wallet,
                                  size: 50,
                                ),
                                Column(
                                  children: [
                                    Text("fatura Atual",
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: Colors.white))),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text('R\$ ' "500,00",
                                          style: GoogleFonts.fredoka(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  color: Color(0xFF5F5DA6)))),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.wallet,
                                  size: 50,
                                ),
                                Column(
                                  children: [
                                    Text("Fatura Futura",
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: Colors.white))),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text('R\$ ' "500,00",
                                          style: GoogleFonts.fredoka(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  color: Color(0xFF5F5DA6)))),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Homepage())));
                                //
                              },
                              icon: const Icon(Icons.arrow_circle_left_rounded,
                                  size: 30)),
                          Column(
                            children: [
                              Text('Mês',
                                  style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ))),
                              Text("Novembro",
                                  style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white))),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                //
                              },
                              icon: const Icon(Icons.arrow_circle_right_rounded,
                                  size: 30))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: listName.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            color: Color(0xFF2E4159),
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
                                Text(listName[index],
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
                            height: 2,
                            color: Colors.white,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              color: const Color(0xFF5F5DA6),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Saldo Livre',
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ))),
                        Text('R\$ ' "50,00",
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            )))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total pago',
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ))),
                        Text("R\$ " "200,00",
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            )))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => AddEvent())));
        }),
        child: Icon(
          Icons.add_card_rounded,
          color: Color(0xFF5F5DA6),
          size: 25,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
