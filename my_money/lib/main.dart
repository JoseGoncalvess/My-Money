import 'package:flutter/material.dart';
import 'package:my_money/views/AddEvent.dart';
import 'package:my_money/views/HomePage.dart';
import 'package:my_money/views/MyPage.dart';
import 'package:my_money/views/selected_avatar.dart';
import 'package:my_money/views/user.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const AvatarUser(),
    );
  }
}
