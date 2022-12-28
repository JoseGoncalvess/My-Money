import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_money/app/valores/avatar_info.dart';
import 'package:swipe_deck/swipe_deck.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SelectedAvatr(),
    );
  }
}

class SelectedAvatr extends StatefulWidget {
  const SelectedAvatr({super.key});

  @override
  State<SelectedAvatr> createState() => _SelectedAvatrState();
}

class _SelectedAvatrState extends State<SelectedAvatr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E4159),
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
              onPressed: () {
                showAnimatedDialog(
                  barrierColor: Color.fromARGB(164, 95, 93, 166),
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFF5F5DA6),
                      icon: const Icon(
                        Icons.warning_amber_rounded,
                        size: 30,
                      ),
                      title: const Text(
                        'Muito Importante',
                      ),
                      content: const Text(
                        "Olá, Seja Muito ebm vindo, antes de seguirmos, todas as Informações estão corretas?",
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        MaterialButton(
                          onPressed: () => {},
                          child: const Text(
                            'Sim!',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    );
                  },
                  animationType: DialogTransitionType.fade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 400),
                );
              },
              icon: const Icon(
                Icons.help_outline_rounded,
                size: 30,
              ))
        ],
      ),
      body: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          decoration: BoxDecoration(color: Color(0xFF2E4159)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    print(AvatarInfo().nameA);
                  },
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
                            Container(
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
