import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/model/evento_model.dart';
import 'package:my_money/app/model/metodos/somatoria_valores.dart';
import 'package:my_money/app/valores/avatar_info.dart';
import 'package:my_money/app/widget/components/list_drawer.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../valores/user_info.dart';
import 'Details_view.dart';
import '../widget/components/item_eventslist_wisget.dart';
import 'addevent.dart';

class MyPage extends StatefulWidget {
  const MyPage({
    super.key,
  });

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  double slivre = 0.0;

  //valor fat total
  String valorFat = '';
  //VALOR COMPLETO DA FATURA
  getvaluefat() async {
    SomatoriaValores().getValor().then((value) {
      setState(() {
        valorFat = value.toString();
      });
    });
  }

//VALOR DA FATURA DO MÊS ATUAL
  getFatMonth() async {
    SomatoriaValores().getvalorMes().then((value) {
      setState(() {
        valorFat = value.toString();
      });
    });
  }

//VALOR DOS GATOS DO DIA ATUAL

  getFatDay() async {
    SomatoriaValores().getvalorday().then((value) {
      setState(() {
        valorFat = value.toString();
      });
    });
  }

  //FATURA DO MÊS PASSADO
  String fatMP = '0.0';
  Future getFatMp() async {
    await SomatoriaValores().getvalorMesP().then((value) {
      setState(() {
        fatMP = value.toString();
      });
    });
  }

  //VALOR DAS PROXIMAS FATURAS
  String fatPM = '0.0';
  Future getFatPm() async {
    await SomatoriaValores().getvalorPmes().then((value) {
      setState(() {
        fatPM = value.toString();
      });
      return value;
    });
  }

  ///CARREGANDO OS DADOS DE USER
  Future<String> loadPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("foto") ?? "";
  }

  String version = '';
  @override
  void initState() {
    Future.delayed(const Duration()).then(
      (value) async {
        await PackageInfo.fromPlatform().then((value) {
          setState(() {
            version = value.version;
            log(version);
          });
        });
      },
    );
    //FUNCION DE FATURAS
    getFatMp();
    getFatPm();

    setState(() {
      getvaluefat();
    });

    setState(() {
      Future.delayed(const Duration(seconds: 1))
          .then((value) => getvaluepercent());
    });

    super.initState();
    //

    DataUser().loadUserData().then((value) => {
          setState(() {
            DataUser.userData = value;
          })
        });
    loadPhoto().then((value) {
      // O VALUE É O RETORNO DA FUNÇÃO loadPhoto
      if (value.isNotEmpty) {
        AvatarInfo.retrato = value;
      }
    });

    loadEvent();
  }

//função pra carregar o evento
  List<Evento> eventoC = [];
  loadEvent() {
    EventosUSerPreference().loadList().then((value) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      int contlist = sharedPreferences.getInt('conterList') ?? 0;
      log(' o numeor de coisas são exatamenre $contlist');

      setState(() {
        eventoC = value;

        log(contlist.toString());
      });
    });
  }

//carregar porcentagem
  getvaluepercent() async {
    await SomatoriaValores().getperc().then((value) {
      setState(() {
        slivre = value;
      });
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
        child: ListDrawer(
          versioApp: version,
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
                              child: Text(
                                'Saldo em Conta',
                                style: GoogleFonts.fredoka(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 140,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'R\$ ${DataUser.userData.patrimonio}',
                                style: GoogleFonts.fredoka(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xFF5F5DA6),
                                  ),
                                ),
                              ),
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
                height: MediaQuery.of(context).size.height * 0.52,
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
                                        getFatDay();
                                      });
                                    }),
                                    child: Text(
                                      'Dia',
                                      style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        getFatMonth();
                                      });
                                    }),
                                    child: Text(
                                      'Mês',
                                      style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: CircularPercentIndicator(
                          radius: 95.0,
                          lineWidth: 38.0,
                          animation: true,
                          percent: slivre == '' ? 0.0 : slivre,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    log('CLiquei no circulo e deu nisso!');
                                    setState(() {
                                      getvaluepercent();
                                      getvaluefat();
                                    });
                                  });
                                },
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Fatura atual',
                                        style: GoogleFonts.fredoka(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        'R\$' ' $valorFat',
                                        style: GoogleFonts.fredoka(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22,
                                              color: Colors.white),
                                        ),
                                      ),
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
                                      getFatMp();
                                    },
                                    icon: const Icon(
                                      Icons.wallet_rounded,
                                      size: 40,
                                    )),
                                Text(
                                  'Ultima Fatura',
                                  style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Text('R\$ ' '$fatMP',
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
                                      getFatPm();
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
                                  child: Text(
                                    'R\$ ' '$fatPM',
                                    style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Color(0xFF5F5DA6),
                                      ),
                                    ),
                                  ),
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
                child: eventoC.isEmpty
                    ? SizedBox(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.note_add_rounded,
                              size: 130,
                              color: Color(0xFF2E4159),
                            ),
                            Text(
                              'Adicione Novos  Eventos',
                              style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xFF2E4159),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: eventoC.length + 1,
                        itemBuilder: (BuildContext context, index) {
                          return index == eventoC.length
                              ? Container(
                                  height: 80,
                                )
                              : ItemeEventListWidget(
                                  //FUNÇÃO DE EXCLUIR
                                  onPressed: () async {
                                    log('EXCLUIR ITEM DA LISTA COISA $index');

                                    EventosUSerPreference()
                                        .deletItemList(index)
                                        .then((value) async {
                                      setState(() {
                                        eventoC.remove(eventoC[index]);
                                      });
                                    });

                                    setState(() {
                                      getvaluepercent();
                                      getvaluefat();
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  evento: eventoC[index].evento,
                                  data: eventoC[index].data,
                                  valor: eventoC[index].valor);
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
        child: const Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
