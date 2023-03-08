import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackDirecional {
  //FUNÇÃO FUTURA QUE EXECUTA A URL
  laucheurl({context, required String assunto, required String corpo}) async {
    //RECEBO OS PARAMETROA ATRAVES DA FUNÇÃO
    String email = Uri.encodeComponent('joseinacoi774@gmail.com');
    String subject = Uri.encodeComponent(assunto);
    String body = Uri.encodeComponent(corpo);
//TRSNFORMO EM TIPO "URI" JA PASSANDO O CORPO DO TIPO EMAIL SEGUINDO A ESTRUTURA DO URI
    Uri url = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color(0xFF5F5DA6),
        content: const Text(
          'Feedback enviado com sucesso',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        action: SnackBarAction(
            label: 'Ok', textColor: Colors.white, onPressed: () {}),
      ));
    }
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color(0xFF5F5DA6),
        content: const Text(
          'Erro ao enviar seu feedback!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        action: SnackBarAction(
            label: 'Reenviar', textColor: Colors.white, onPressed: () {}),
      ));
    }
  }
}
