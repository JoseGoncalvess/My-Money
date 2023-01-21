import 'package:flutter/cupertino.dart';
import 'package:my_money/app/model/lista_eventos.dart';

main() {
  int valor = int.parse(Eventos.eventos[0].valor);
  print(valor);
}

class SomatoriaValores {
  Future<double> getValor(List<double> listvalue) async {
    for (int i = 0; i < Eventos.eventos.length; i++) {
      print(i);
    }

    return 0;
  }
}
