import 'package:flutter/material.dart';
import 'app/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('es'),
        Locale('pt')
      ],
      theme: ThemeData.dark(),
      home: const Splashpage(),
    );
  }
}
