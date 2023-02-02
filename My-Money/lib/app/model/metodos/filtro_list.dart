import 'dart:core';
import 'package:my_money/app/model/evento_model.dart';

class FiltroList {
  List<Evento> filtermes(int mes) {
    List<Evento> filtrMonth = [];
    for (int i = 0; i < EventosUSerPreference().eventosC.length; i++) {
      if (int.parse(EventosUSerPreference().eventosC[i].data.split('/')[1]) ==
          mes) {
        filtrMonth.add(EventosUSerPreference().eventosC[i]);
      }
    }

    return filtrMonth;
  }

  double calcTotalFilter(List<Evento> list) {
    double resultSoma = 0;
    for (var element in list) {
      resultSoma =
          double.parse(element.valor.replaceAll(',', '.')) + resultSoma;
    }
    return resultSoma;
  }
}
