import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/user_info.dart';
import 'package:my_money/app/valores/avatar_info.dart';
import 'package:my_money/app/widget/pages/Details_View.dart';
import 'package:my_money/views/AddEvent.dart';
import 'package:my_money/views/HomePage.dart';
import 'package:my_money/views/selected_avatar.dart';

class MyPage extends StatefulWidget {
  const MyPage({
    super.key,
  });

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

//CARREGANDO OS DADOS DE USER
//=========================================================================
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

//======================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E4159),
      drawer: Drawer(
        backgroundColor: const Color(0xFF2E4159),
        child: ListView(
          children: [
            Container(
              color: const Color(0xFF5F5DA6),
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("Perfil",
                          style: GoogleFonts.fredoka(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.white))),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const SelectedAvatr())));
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                    style: BorderStyle.solid),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: AssetImage(AvatarInfo.retrato.isEmpty
                                        ? 'assets/img/sem_logo.jpg'
                                        : AvatarInfo.retrato))),
                          ),
                        ),
                        Text(_userData.name,
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.white)))
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.support_agent_rounded,
                size: 28,
              ),
              title: Text('Suporte',
                  style: GoogleFonts.fredoka(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white))),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF5F5DA6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu_rounded)),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          child: Text('Saldo em Conta',
                              style: GoogleFonts.fredoka(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white))),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 140,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('R\$ ${_userData.patrimonio}',
                              style: GoogleFonts.fredoka(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xFF5F5DA6)))),
                        )
                      ],
                    ),
                    SizedBox(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.receipt_long_rounded)),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xFF2E4159),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(22),
                        bottomLeft: Radius.circular(22))),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                                icon: const Icon(
                                    Icons.arrow_circle_left_rounded,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              DetalhesPage())));
                                },
                                icon: const Icon(
                                    Icons.arrow_circle_right_rounded,
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
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, top: 1),
                        child: Column(
                          children: [
                            Container(
                              height: 105,
                              color: const Color(0xFF2E4159),
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
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            color: Color(0xFF2E4159))),
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
