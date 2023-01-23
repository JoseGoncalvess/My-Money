import 'package:flutter/cupertino.dart';
import 'package:my_money/app/model/lista_eventos.dart';

/// CAUCULANDO OS VALORES DE TODOS OS ITENS DA LISTA
class SomatoriaValores {
  double getValor() {
    double result = 0;
    for (int i = 0; i < Eventos.eventos.length; i++) {
      result = result + int.parse(Eventos.eventos[i].valor);
    }

    return result;
  }

  ///Soma valores do meu atual
  double getvalorMes() {
    double resultMp = 0;
    var datetime = DateTime.now().month;

    for (int i = 0; i < Eventos.eventos.length; i++) {
      if (int.parse(Eventos.eventos[i].data.split('/')[1]) == datetime) {
        resultMp = resultMp + int.parse(Eventos.eventos[i].valor);
      } else {}
    }

    return resultMp;
  }

  ///soma valores gastos no dia
  double getvalorday() {
    double resultday = 0;
    var datetime = DateTime.now().day;

    for (int i = 0; i < Eventos.eventos.length; i++) {
      if (int.parse(Eventos.eventos[i].data.split('/')[0]) == datetime) {
        resultday = resultday + int.parse(Eventos.eventos[i].valor);
      } else {}
    }

    return resultday;
  }

  ///soma valores gasto durante o ano
  double getvalorY() {
    double resultday = 0;
    var datetime = DateTime.now().year;

    for (int i = 0; i < Eventos.eventos.length; i++) {
      if (int.parse(Eventos.eventos[i].data.split('/')[2]) == datetime) {
        resultday = resultday + int.parse(Eventos.eventos[i].valor);
      } else {}
    }

    return resultday;
  }

  double getvalorMesP() {
    double resultMp = 0;
    var datetime = DateTime.now().month;
    if (datetime == 1) {
      datetime = 12;
    } else {
      datetime = datetime - 1;
    }

    for (int i = 0; i < Eventos.eventos.length; i++) {
      if (int.parse(Eventos.eventos[i].data.split('/')[1]) == datetime) {
        resultMp = resultMp + int.parse(Eventos.eventos[i].valor);
      } else {}
    }

    return resultMp;
  }

  double getvalorPmes() {
    double resultPM = 0;
    var datetime = DateTime.now().month;
    if (datetime == 12) {
      datetime = 1;
    } else {
      datetime = datetime + 1;
    }

    for (int i = 0; i < Eventos.eventos.length; i++) {
      if (int.parse(Eventos.eventos[i].data.split('/')[1]) == datetime) {
        resultPM = resultPM + int.parse(Eventos.eventos[i].valor);
      } else {}
    }
    print(datetime);
    print(resultPM);
    return resultPM;
  }
}
