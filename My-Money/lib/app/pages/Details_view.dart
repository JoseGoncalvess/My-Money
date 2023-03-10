import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/model/editor_data.dart';
import 'package:my_money/app/model/evento_model.dart';
import 'package:my_money/app/model/metodos/filtro_list.dart';
import 'package:my_money/app/model/metodos/somatoria_valores.dart';
import '../valores/user_info.dart';
import '../widget/components/item_eventslist_wisget.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({super.key});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  int month = DateTime.now().month;
  final ScrollController _controller = ScrollController();

  List<Evento> efiltro = [];
  double slivre = 0;

  filtrolist() {
    FiltroList().filtermes(month).then((value) {
      setState(() {
        efiltro = value;
      });
    });
  }

  @override

  //Atualiza a tela pasadno p´ra lista o valor do mes e mudando conforme o atual
  void initState() {
    _controller.addListener(() async {
      log('qualquer merda');
    });
    super.initState();
    filtrolist();
    getvalor();

    log(efiltro.toString());
  }

  Future getvalor() async {
    slivre = int.parse(DataUser.userData.patrimonio) -
        await SomatoriaValores().getValor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5DA6),
        elevation: 0,
        centerTitle: true,
        title: Text('Seu Mês em Detalhes',
            style: GoogleFonts.fredoka(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white))),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xFF5F5DA6),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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
                                    onPressed: () {
                                      setState(() {
                                        if (month == 1) {
                                          month = 12;
                                        } else {
                                          month--;
                                        }
                                        filtrolist();
                                      });
                                      log('OO MÊS AGORA É $month');
                                      log('ERA  PRA VOLTAR PARA O MÊS ANTERIO, FOI ?');
                                    },
                                    icon: const Icon(
                                        Icons.arrow_circle_left_rounded)),
                                Text(EditorData().datames(month.toString()),
                                    style: GoogleFonts.fredoka(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Colors.white))),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (month == 12) {
                                          month = 1;
                                        } else {
                                          month++;
                                        }

                                        filtrolist();
                                      });
                                      log('ERA  PRA IR POR PROXIMO MÊS, FOI ?');
                                      log('O MÊS AGORA É $month');
                                    },
                                    icon: const Icon(
                                        Icons.arrow_circle_right_rounded)),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    controller: _controller,
                    itemCount: efiltro.length,
                    itemBuilder: (BuildContext context, index) {
                      return ItemeEventListWidget(
                          onPressed: () {},
                          evento: efiltro[index].evento,
                          data: efiltro[index].data,
                          valor: efiltro[index].valor.toString());
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
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
                          Text(
                              'R\$ '
                              '${FiltroList().calcTotalFilter(efiltro)}',
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
                          Text(
                              "R\$ "
                              "$slivre",
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
