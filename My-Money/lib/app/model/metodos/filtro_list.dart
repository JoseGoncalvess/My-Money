import 'dart:core';
import 'package:my_money/app/model/evento_model.dart';

class FiltroList {
  Future<List<Evento>> filtermes(int mes) async {
    List<Evento> filtrMonth = [];

    await EventosUSerPreference().loadList().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              if (int.parse(value[i].data.split('/')[1]) == mes)
                {filtrMonth.add(value[i])}
            }
        });

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
