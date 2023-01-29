import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money/app/model/evento_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../valores/user_info.dart';
import 'HomePage.dart';
import 'mypage.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

Future<String> loadPhoto() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("foto") ?? "";
}

Future loadEventoUser() async {
  EventoUser().loadEventoUser();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
//CARREGA OS DADOS A SEREM EXIBIDOS
    DataUser().loadUserData().then((value) => {
          setState(() {
            DataUser.userData = value;
            loadEventoUser();
          })
        });
//CARREGA O VALOR DE FOTO D EPERFIL QUE CASO SEJA VAZIO
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          loadPhoto().then((value) {
            // O VALUE É O RETORNO DA FUNÇÃO loadPhoto
            if (value.isEmpty) {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => const Homepage()));
            } else {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => const MyPage()));
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F5DA6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset('assets/img/logo_splash.png')],
      ),
    );
  }
}
