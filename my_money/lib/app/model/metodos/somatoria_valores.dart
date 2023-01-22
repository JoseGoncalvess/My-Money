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
}
