import 'package:flutter/material.dart';
import 'package:my_money/views/HomePage.dart';
import 'package:my_money/views/user.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const UserCard(),
    );
  }
}
