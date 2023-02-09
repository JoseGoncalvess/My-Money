import 'dart:core';
import 'package:my_money/app/model/evento_model.dart';

class FiltroList {
  Future<List<Evento>> filtermes(int mes) async {
    List<Evento> mylist = await EventosUSerPreference().loadList();
    List<Evento> filtrMonth = [];
    for (int i = 0; i < mylist.length; i++) {
      if (int.parse(mylist[i].data.split('/')[1]) == mes) {
        filtrMonth.add(mylist[i]);
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
