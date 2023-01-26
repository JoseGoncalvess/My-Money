import 'dart:core';
import 'package:my_money/app/model/evento_model.dart';
import 'package:my_money/app/model/lista_eventos.dart';

class FiltroList {
  List<ListEvento> filtermes(int mes) {
    List<ListEvento> filtrMonth = [];
    for (int i = 0; i < Eventos.eventos.length; i++) {
      if (int.parse(Eventos.eventos[i].data.split('/')[1]) == mes) {
        filtrMonth.add(Eventos.eventos[i]);
      }
    }

    return filtrMonth;
  }
}
