import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/user_info.dart';
import 'package:my_money/app/valores/avatar_info.dart';
import 'package:my_money/app/widget/pages/Details_view.dart';
import 'package:my_money/views/AddEvent.dart';
import 'package:my_money/views/Faq.dart';
import 'package:my_money/views/HomePage.dart';
import 'package:my_money/views/user.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:my_money/views/selected_avatar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../app/model/lista_eventos.dart';
import '../app/widget/pages/components/item_eventslist_wisget.dart';
import 'configApp.dart';

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
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xFF2E4159),
      drawer: Drawer(
        backgroundColor: const Color(0xFF2E4159),
        child: ListView(
          children: [
            Container(
              color: const Color(0xFF5F5DA6),
              height: MediaQuery.of(context).size.height * 0.15,
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Homepage())));
              },
              leading: const Icon(
                Icons.home_rounded,
                size: 28,
              ),
              title: Text('Inicio',
                  style: GoogleFonts.fredoka(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white))),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => UserCard())));
              },
              leading: const Icon(
                Icons.person_outline_rounded,
                size: 28,
              ),
              title: Text('Perfi',
                  style: GoogleFonts.fredoka(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white))),
            ),
            ListTile(
              onTap: () {},
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
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ConfigApp())));
              },
              leading: const Icon(
                Icons.settings_rounded,
                size: 28,
              ),
              title: Text('Configuração',
                  style: GoogleFonts.fredoka(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white))),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const Faq())));
              },
              leading: const Icon(
                Icons.help_outline_rounded,
                size: 28,
              ),
              title: Text('FAQ',
                  style: GoogleFonts.fredoka(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white))),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 70,
                    color: const Color(0xFF2E4159),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF5F5DA6),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22),
                            bottomRight: Radius.circular(22))),
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: IconButton(
                              onPressed: () => _key.currentState!.openDrawer(),
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const DetalhesPage())));
                              },
                              icon: const Icon(Icons.receipt_long_rounded)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xFF2E4159),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: [
                            Text('Resumo Financeiro',
                                style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white))),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF5F5DA6),
                                  borderRadius: BorderRadius.circular(8)),
                              height: 35,
                              width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: (() {}),
                                    child: Text('Dia',
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: Colors.white))),
                                  ),
                                  GestureDetector(
                                    onTap: (() {}),
                                    child: Text('Mês',
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: Colors.white))),
                                  ),
                                  GestureDetector(
                                    onTap: (() {}),
                                    child: Text('Ano',
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: Colors.white))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircularPercentIndicator(
                          radius: 95.0,
                          lineWidth: 38.0,
                          animation: true,
                          percent: 0.3,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Fatura atual',
                                  style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white))),
                              Text('R\$ 500',
                                  style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                          color: Colors.white))),
                            ],
                          ),
                          progressColor: const Color(0xFF5F5DA6),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.wallet_rounded,
                                      size: 40,
                                    )),
                                Text("Ultima fatura",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white))),
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text('R\$ ' "500,00",
                                      style: GoogleFonts.fredoka(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Color(0xFF5F5DA6)))),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.wallet_rounded,
                                      size: 40,
                                    )),
                                Text("Ultima fatura",
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white))),
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text('R\$ ' "500,00",
                                      style: GoogleFonts.fredoka(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
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
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: Eventos().eventos.length,
                    itemBuilder: (BuildContext context, index) {
                      return ItemeEventListWidget(
                          evento: Eventos().eventos[index].evento,
                          data: Eventos().eventos[index].data,
                          valor: Eventos().eventos[index].valor);
                      ;
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF5F5DA6),
        elevation: 2,
        onPressed: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddEvent())));
        }),
        child: Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
