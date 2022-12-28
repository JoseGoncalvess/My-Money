import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final List<String> imagesA = [
    'assets/img/boi.png',
    'assets/img/cap.png',
    'assets/img/peralta.png',
    'assets/img/julius.png',
    'assets/img/rosa.png',
    'assets/img/sargento.png',
    'assets/img/sirigueijo.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: imagesA.length,
              options: CarouselOptions(
                height: 500,
                scrollDirection: Axis.vertical,
                autoPlay: false,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.easeInOutQuart,
                enableInfiniteScroll: false,
                initialPage: 0,
              ),
              itemBuilder: (context, index, realIndex) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            height: 300,
                            width: 500,
                            margin: const EdgeInsets.symmetric(vertical: 21),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                imagesA[index],
                                fit: BoxFit.cover,
                                width: 500,
                              ),
                            )),
                        Text(
                          'nome',
                          style: GoogleFonts.fredoka(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  color: Colors.white)),
                        )
                      ],
                    ));
              },
            )
          ],
        )),
      ),
    );
  }
}
