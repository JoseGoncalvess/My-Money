import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/valores/avatar_info.dart';
import 'package:my_money/views/HomePage.dart';
import 'package:my_money/views/user.dart';
import 'package:swipe_deck/swipe_deck.dart';

import '../app/user_info.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectedAvatr();
  }
}

String foto = foto;

class SelectedAvatr extends StatefulWidget {
  const SelectedAvatr({super.key});

  @override
  State<SelectedAvatr> createState() => _SelectedAvatrState();
}

class _SelectedAvatrState extends State<SelectedAvatr> {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: ((context) => UserCard())));
            },
          )
        ],
      ),
      body: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            showAnimatedDialog(
              barrierColor: const Color.fromARGB(164, 95, 93, 166),
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color(0xFF5F5DA6),
                  icon: const Icon(
                    Icons.person_pin_rounded,
                    size: 60,
                  ),
                  title: Text('Perssonalidade',
                      style: GoogleFonts.fredoka(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white))),
                  content: Text(
                      "Uma Seleção Exclusiva de Avatar para melhor representa sua perssonalidade!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fredoka(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 19,
                              color: Colors.white))),
                  actions: [
                    Align(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Text('ok',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.white))),
                      ),
                    ),
                  ],
                );
              },
              animationType: DialogTransitionType.slideFromTop,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 400),
            );
          }),
          backgroundColor: const Color(0xFF5F5DA6),
          child: const Icon(Icons.help_outline_rounded,
              color: Colors.white, size: 35),
        ),
        body: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(color: Color(0xFF2E4159)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: CarouselSlider.builder(
                      itemCount: AvatarInfo().imagesA.length,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        scrollDirection: Axis.vertical,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                foto = AvatarInfo().imagesA[index];
                                UserDatePreference().saveFotoDate(foto);
                                print(foto);
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
              ),
            ],
          ),
        )),
      ),
    );
  }
}
