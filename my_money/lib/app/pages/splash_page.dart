import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
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
