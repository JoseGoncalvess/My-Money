import 'package:flutter/material.dart';
import 'package:my_money/app/model/metodos/feedback_direcional.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController assunto = TextEditingController();
    TextEditingController corpor = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5F5DA6),
          title: const Text(
            'Contate o Suporte',
          ),
        ),
        body: Container(
          color: Color.fromARGB(201, 73, 79, 86),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width,
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text('Posso te ajuar em algo ?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: const Image(
                    image: AssetImage('assets/img/sup.png'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sua Opinião nos ajuda a ser melhores!'),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text('Titulo'),
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      filled: true,
                      fillColor: Color(0xFF5F5DA6),
                    ),
                    controller: assunto,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text('Assunto'),
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      filled: true,
                      fillColor: Color(0xFF5F5DA6),
                    ),
                    keyboardType: TextInputType.multiline,
                    controller: corpor,
                  ),
                ),
                ElevatedButton(
                    onPressed: () => FeedbackDirecional().laucheurl(
                        context: context,
                        assunto: assunto.text,
                        corpo: corpor.text),
                    child: const Text('Enviar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
