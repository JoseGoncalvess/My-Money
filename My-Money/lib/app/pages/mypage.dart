import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/model/metodos/somatoria_valores.dart';

import 'package:my_money/app/valores/avatar_info.dart';
import 'package:my_money/app/widget/components/list_drawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/lista_eventos.dart';
import '../valores/user_info.dart';
import 'Details_view.dart';
import 'Faq.dart';
import 'HomePage.dart';
import '../widget/components/item_eventslist_wisget.dart';
import 'addevent.dart';
import 'config_app.dart';
import 'selected_avatar.dart';
import 'user.dart';

class MyPage extends StatefulWidget {
  const MyPage({
    super.key,
  });

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  ///Variaves de aceso rapido a soma

  //valor fat total
  String valorFat = SomatoriaValores().getValor().toString();
  //valor fat mês
  String fatMP = SomatoriaValores().getvalorMesP().toString();
  //VALOR DAS PROXIMAS FATURAS
  String fatPM = SomatoriaValores().getvalorPmes().toString();

  ///CARREGANDO OS DADOS DE USER
  Future<String> loadPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("foto") ?? "";
  }

  @override
  void initState() {
    super.initState();

    DataUser().loadUserData().then((value) => {
          setState(() {
            DataUser.userData = value;
          })
        });
    loadPhoto().then((value) {
      // O VALUE É O RETORNO DA FUNÇÃO loadPhoto
      if (value.isNotEmpty) {
        AvatarInfo.retrato = value;
        log('o retarato não esta vazio');
      }
    });
  }

//======================================================================
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xFF2E4159),
      drawer: const Drawer(
        backgroundColor: Color(0xFF2E4159),
        child: ListDrawer(),
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
                              child: Text('R\$ ${DataUser.userData.patrimonio}',
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
                                    onTap: (() {
                                      setState(() {
                                        valorFat = SomatoriaValores()
                                            .getvalorday()
                                            .toString();
                                      });
                                    }),
                                    child: Text('Dia',
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: Colors.white))),
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        valorFat = SomatoriaValores()
                                            .getvalorMes()
                                            .toString();
                                      });
                                    }),
                                    child: Text('Mês',
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
                          percent: DataUser.userData.patrimonio == ''
                              ? 0.0
                              : SomatoriaValores().getperc(),
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    valorFat = SomatoriaValores()
                                        .getValor()
                                        .toString();
                                  });
                                },
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Text('Fatura atual',
                                          style: GoogleFonts.fredoka(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.white))),
                                      Text('R\$' ' ${valorFat}',
                                          style: GoogleFonts.fredoka(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                  color: Colors.white))),
                                    ],
                                  ),
                                ),
                              )
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
                                    onPressed: () {
                                      SomatoriaValores().getvalorMesP();
                                    },
                                    icon: const Icon(
                                      Icons.wallet_rounded,
                                      size: 40,
                                    )),
                                Text('Ultima Fatura',
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
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Text('R\$' '$fatMP',
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
                                    onPressed: () {
                                      SomatoriaValores().getperc();
                                    },
                                    icon: const Icon(
                                      Icons.wallet_rounded,
                                      size: 40,
                                    )),
                                Text("Proxima Fatura",
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
                                  child: Text('R\$ ' "$fatPM",
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
                    itemCount: Eventos.eventos.length,
                    itemBuilder: (BuildContext context, index) {
                      return ItemeEventListWidget(
                          evento: Eventos.eventos[index].evento,
                          data: Eventos.eventos[index].data,
                          valor: Eventos.eventos[index].valor);
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
