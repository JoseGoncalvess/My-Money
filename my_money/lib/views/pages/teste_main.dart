import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  Future<String> loadPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("photo") ?? "";
  }

  @override
  void initState() {
    loadPhoto().then((value) {
      // O VALUE É O RETORNO DA FUNÇÃO loadPhoto
      if(value.isEmpty){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const PageOne()));
      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PageTwo(foto: value,)));
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const  [
          FlutterLogo(size: 200),
          SizedBox(height: 12,),
          Center(child: Text("TAMO CARREGANDO, ESPERA KARAI")),
          SizedBox(height: 20,),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}


class PageOne extends StatefulWidget {
  const PageOne({super.key,});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  
  List<String> images = [
    "https://cdn2.vectorstock.com/i/1000x1000/20/76/man-avatar-profile-vector-21372076.jpg",
    "https://cdn5.vectorstock.com/i/1000x1000/20/74/woman-avatar-profile-vector-21372074.jpg",
    "https://cdn3.vectorstock.com/i/1000x1000/20/67/woman-avatar-profile-vector-21372067.jpg",
    "https://cdn1.vectorstock.com/i/1000x1000/20/65/man-avatar-profile-vector-21372065.jpg",
  ];

  void savePhoto(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("photo", value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PAGINA 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Escolha uma avatar de perfil:',
            ),
            const SizedBox(height: 12,),
            SizedBox(
              // color: Colors.red,
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () async {
                        savePhoto(images[index]);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PageTwo(foto: images[index])));
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(images[index],),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                  );
                },
              scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
      
    );
  }
}


class PageTwo extends StatefulWidget {
  final String foto;
  const PageTwo({super.key, required this.foto});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 50,
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(widget.foto),
                fit: BoxFit.cover
              )
            ),
          ),
        )
      ),
    );
  }
}