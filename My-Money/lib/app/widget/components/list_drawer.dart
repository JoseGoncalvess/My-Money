// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../pages/Faq.dart';
import '../../pages/selected_avatar.dart';
import '../../pages/user.dart';
import '../../valores/avatar_info.dart';
import '../../valores/user_info.dart';

class ListDrawer extends StatefulWidget {
  const ListDrawer({
    Key? key,
    required this.versioApp,
  }) : super(key: key);

  final String versioApp;

  @override
  State<ListDrawer> createState() => _ListDrawerState();
}

class _ListDrawerState extends State<ListDrawer> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      Text(DataUser.userData.name,
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
          // ListTile(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: ((context) => const Homepage())));
          //   },
          //   leading: const Icon(
          //     Icons.home_rounded,
          //     size: 28,
          //   ),
          //   title: Text('Inicio',
          //       style: GoogleFonts.fredoka(
          //           textStyle: const TextStyle(
          //               fontWeight: FontWeight.w600,
          //               fontSize: 20,
          //               color: Colors.white))),
          // ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.78,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const UserCard())));
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Versão ' + widget.versioApp,
                style: GoogleFonts.fredoka(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              const Icon(Icons.verified_user_rounded),
            ],
          )
        ],
      ),
    );
  }
}
