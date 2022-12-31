import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/valores/avatar_info.dart';
import 'package:my_money/views/metodos/showDialoganimated.dart';
import 'package:my_money/views/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectedAvatr();
  }
}

class SelectedAvatr extends StatefulWidget {
  const SelectedAvatr({super.key});

  @override
  State<SelectedAvatr> createState() => _SelectedAvatrState();
}

class _SelectedAvatrState extends State<SelectedAvatr> {
  //// SALVANDO IMAGEM

  final List<String> imagesA = [
    'assets/img/boi.png',
    'assets/img/cap.png',
    'assets/img/peralta.png',
    'assets/img/julius.png',
    'assets/img/rosa.png',
    'assets/img/sargento.png',
    'assets/img/sirigueijo.png',
    'assets/img/bitcoin.png',
    'assets/img/caramelo.png',
    'assets/img/ethereum.png',
    'assets/img/lobo.png',
    'assets/img/monopoli.png'
  ];

  void saveImg(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("foto", value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 1)).then((value) {
      alertAnimated(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E4159),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5DA6),
        title: Center(
          child: Text('Selecione seu avatar',
              style: GoogleFonts.fredoka(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.white))),
        ),
      ),
      body: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {}),
          child: Icon(
            Icons.help_outline_rounded,
            color: Colors.white,
            size: 35,
          ),
          backgroundColor: const Color(0xFF5F5DA6),
        ),
        body: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(color: Color(0xFF2E4159)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: CarouselSlider.builder(
                    itemCount: AvatarInfo().imagesA.length,
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      scrollDirection: Axis.vertical,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.easeInOutQuart,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Column(
                        children: [
                          GestureDetector(
                            //Aquiiiii
                            onTap: () async {
                              AvatarInfo.retrato = AvatarInfo().imagesA[index];
                              saveImg(AvatarInfo().imagesA[index]);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => UserCard())));
                            },
                            child: Container(
                                height: 300,
                                width: 400,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    AvatarInfo().imagesA[index],
                                    fit: BoxFit.cover,
                                    width: 500,
                                  ),
                                )),
                          ),
                          Text(
                            AvatarInfo().nameA[index],
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.white)),
                          ),
                          Text(
                            AvatarInfo().history[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                    color: Colors.white)),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
