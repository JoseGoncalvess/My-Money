import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/views/MyPage.dart';

final parcelController = TextEditingController();

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override

  ///VAriaveis de controle de seleção
  int indexTag = 0;
  int indexPag = 0;
  int indexAlert = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E4159),
      //importante para teclado que transborda

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Novas Dispesas',
                                  style: GoogleFonts.fredoka(
                                      textStyle: const TextStyle(
                                    fontSize: 30.0,
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
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFF8F8EBF),
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
                                          maxLength: 10,
                                          keyboardType: TextInputType.datetime,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xFF8F8EBF),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              floatingLabelAlignment:
                                                  FloatingLabelAlignment.center,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              hintText: "DD/MM/AA",
                                              hintStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              labelText: 'DD/MM/AA',
                                              labelStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                              disabledBorder:
                                                  InputBorder.none)),
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
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor:
                                                  const Color(0xFF8F8EBF),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              floatingLabelAlignment:
                                                  FloatingLabelAlignment.center,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              hintText: "R\$100,00",
                                              hintStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              labelText: 'R\$100,00',
                                              labelStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                              disabledBorder:
                                                  InputBorder.none)),
                                    )
                                  ],
                                )
                              ],
                            ),

                            Text("Tag",
                                style: GoogleFonts.fredoka(
                                    textStyle: const TextStyle(
                                  fontSize: 30,
                                  color: Color(0xFF2E4159),
                                  fontWeight: FontWeight.bold,
                                ))),

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
                                                color: indexTag == 1
                                                    ? const Color(0xFF2E4159)
                                                    : const Color(0xFF5F5DA6),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  indexTag = 1;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.medical_services_rounded,
                                                size: 40,
                                              ),
                                            )),
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
                                                color: indexTag == 2
                                                    ? Color(0xFF2E4159)
                                                    : const Color(0xFF5F5DA6),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  indexTag = 2;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.restaurant_rounded,
                                                size: 40,
                                              ),
                                            )),
                                        Text("Alimentação",
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
                                                color: indexTag == 3
                                                    ? Color(0xFF2E4159)
                                                    : const Color(0xFF5F5DA6),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  indexTag = 3;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.park_rounded,
                                                size: 40,
                                              ),
                                            )),
                                        Text("Lazer",
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
                                                color: indexTag == 4
                                                    ? Color(0xFF2E4159)
                                                    : const Color(0xFF5F5DA6),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  indexTag = 4;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.work,
                                                size: 40,
                                              ),
                                            )),
                                        Text("Trabalho",
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
                                                color: indexTag == 5
                                                    ? Color(0xFF2E4159)
                                                    : const Color(0xFF5F5DA6),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  indexTag = 5;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.luggage_rounded,
                                                size: 40,
                                              ),
                                            )),
                                        Text("Ferias",
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
                                                color: indexTag == 6
                                                    ? Color(0xFF2E4159)
                                                    : const Color(0xFF5F5DA6),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  indexTag = 6;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.flight_rounded,
                                                size: 40,
                                              ),
                                            )),
                                        Text("Viagem",
                                            style: GoogleFonts.fredoka(
                                                textStyle: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF2E4159),
                                              fontWeight: FontWeight.bold,
                                            ))),
                                      ],
                                    ))
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Pagamento:",
                                          style: GoogleFonts.fredoka(
                                              textStyle: const TextStyle(
                                            fontSize: 30,
                                            color: Color(0xFF2E4159),
                                            fontWeight: FontWeight.bold,
                                          ))),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                              child: Column(
                                            children: [
                                              Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      color: indexPag == 1
                                                          ? const Color(
                                                              0xFF2E4159)
                                                          : const Color(
                                                              0xFF5F5DA6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        indexPag = 1;
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.payments_rounded,
                                                      size: 25,
                                                    ),
                                                  )),
                                              Text("Dinheiro",
                                                  style: GoogleFonts.fredoka(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF2E4159),
                                                    fontWeight: FontWeight.w400,
                                                  ))),
                                            ],
                                          )),
                                          Container(
                                            width: 30,
                                          ),
                                          SizedBox(
                                              child: Column(
                                            children: [
                                              Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      color: indexPag == 2
                                                          ? const Color(
                                                              0xFF2E4159)
                                                          : const Color(
                                                              0xFF5F5DA6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        indexPag = 2;
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.credit_card_rounded,
                                                      size: 25,
                                                    ),
                                                  )),
                                              Text("Cartão",
                                                  style: GoogleFonts.fredoka(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF2E4159),
                                                    fontWeight: FontWeight.w400,
                                                  ))),
                                            ],
                                          ))
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Parcelas:",
                                            style: GoogleFonts.fredoka(
                                                textStyle: const TextStyle(
                                              fontSize: 30,
                                              color: Color(0xFF2E4159),
                                              fontWeight: FontWeight.bold,
                                            ))),
                                        Container(
                                            alignment: Alignment.center,
                                            height: 25,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF2E4159),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: TextField(
                                              onSubmitted: (value) {
                                                validatePArcel();
                                              },
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                  counterText: '',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none),
                                              controller: parcelController,
                                              keyboardType:
                                                  TextInputType.number,
                                              maxLength: 2,
                                            )),
                                        Row(
                                          children: [
                                            Text("Alerta:",
                                                style: GoogleFonts.fredoka(
                                                    textStyle: const TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF2E4159),
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    indexAlert = 1;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.notifications_rounded,
                                                  size: 20,
                                                  color: indexAlert == 1
                                                      ? Color(0xFF2E4159)
                                                      : Color(0xFF5F5DA6),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    indexAlert = 2;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .notifications_active_rounded,
                                                  size: 20,
                                                  color: indexAlert == 2
                                                      ? Color(0xFF2E4159)
                                                      : const Color(0xFF5F5DA6),
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
                            Container(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(255, 45),
                                      shape: const StadiumBorder(),
                                      backgroundColor: const Color(0xFF5F5DA6),
                                    ),
                                    child: Text('SALVAR',
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ))),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const MyPage())));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(150, 40),
                                      shape: const StadiumBorder(),
                                      backgroundColor: const Color(0xFF2E4159),
                                    ),
                                    child: Text('CANCELAR',
                                        style: GoogleFonts.fredoka(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  validatePArcel() {
    var parcela = int.parse(parcelController.text);
    print(parcela);
    if (parcela < 1 || parcela > 12) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: const Text(
          'Numero de Parcelas Incorreto, até 12x!',
          style: TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
            label: 'Ajustar', textColor: Colors.white, onPressed: () {}),
      ));
      parcelController.clear();
    } else {}
  }
}
