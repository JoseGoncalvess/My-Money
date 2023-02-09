import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:my_money/app/valores/user_info.dart';

import '../evento_model.dart';

/// CAUCULANDO OS VALORES DE TODOS OS ITENS DA LISTA
class SomatoriaValores {
  double getValor() {
    double result = 0;
    for (int i = 0; i < EventosUSerPreference().eventosC.length; i++) {
      result = result +
          double.parse(
              EventosUSerPreference().eventosC[i].valor.replaceAll(',', '.'));
    }

    return result;
  }

  ///Soma valores do meu atual
  double getvalorMes() {
    double resultMp = 0;
    var datetime = DateTime.now().month;

    for (int i = 0; i < EventosUSerPreference().eventosC.length; i++) {
      if (int.parse(EventosUSerPreference().eventosC[i].data.split('/')[1]) ==
          datetime) {
        resultMp =
            resultMp + double.parse(EventosUSerPreference().eventosC[i].valor);
      } else {}
    }

    return resultMp;
  }

  ///soma valores gastos no dia
  double getvalorday() {
    double resultday = 0;
    var datetime = DateTime.now().day;

    for (int i = 0; i < EventosUSerPreference().eventosC.length; i++) {
      if (int.parse(EventosUSerPreference().eventosC[i].data.split('/')[0]) ==
          datetime) {
        resultday =
            resultday + double.parse(EventosUSerPreference().eventosC[i].valor);
      } else {}
    }

    return resultday;
  }

  ///soma valores gasto durante o ano
  double getvalorY() {
    double resultday = 0;
    var datetime = DateTime.now().year;

    for (int i = 0; i < EventosUSerPreference().eventosC.length; i++) {
      if (int.parse(EventosUSerPreference().eventosC[i].data.split('/')[2]) ==
          datetime) {
        resultday =
            resultday + double.parse(EventosUSerPreference().eventosC[i].valor);
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

    for (int i = 0; i < EventosUSerPreference().eventosC.length; i++) {
      if (int.parse(EventosUSerPreference().eventosC[i].data.split('/')[1]) ==
          datetime) {
        resultMp =
            resultMp + double.parse(EventosUSerPreference().eventosC[i].valor);
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

    for (int i = 0; i < EventosUSerPreference().eventosC.length; i++) {
      if (int.parse(EventosUSerPreference().eventosC[i].data.split('/')[1]) ==
          datetime) {
        resultPM =
            resultPM + double.parse(EventosUSerPreference().eventosC[i].valor);
      } else {}
    }

    return resultPM;
  }

  ///percentual do patrimonio

  double getperc() {
    double valor = double.parse(DataUser.userData.patrimonio);

    double patrimonio = valor;
    var fatura = SomatoriaValores().getValor();

    double porcent = ((fatura * 100) / patrimonio) / 100;

    return porcent;
  }
}