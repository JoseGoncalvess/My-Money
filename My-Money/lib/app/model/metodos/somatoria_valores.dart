import 'dart:developer';

import 'package:my_money/app/valores/user_info.dart';
import '../evento_model.dart';

/// CAUCULANDO OS VALORES DE TODOS OS ITENS DA LISTA
class SomatoriaValores {
  Future<double> getValor() async {
    double result = 0;
    await EventosUSerPreference().loadList().then((value) {
      // log('o valor qu eu queria ver era ${value.first.valor}');
      for (int i = 0; i < value.length; i++) {
        result = result + double.parse(value[i].valor.replaceAll(',', '.'));
      }
    });
    return result;
  }

  ///CALCULA  A FATURA DO M~ES ATUAL
  Future<double> getvalorMes() async {
    double resultMp = 0;
    var datetime = DateTime.now().month;
    await EventosUSerPreference().loadList().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              if (int.parse(value[i].data.split('/')[1]) == datetime)
                {resultMp = resultMp + double.parse(value[i].valor)}
              else
                {}
            }
        });

    return resultMp;
  }

  ///CAUCULA OS GATOS DO DIA ATUAL
  Future<double> getvalorday() async {
    double resultday = 0;
    var datetime = DateTime.now().day;
    await EventosUSerPreference().loadList().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              if (int.parse(value[i].data.split('/')[0]) == datetime)
                {resultday = resultday + double.parse(value[i].valor)}
              else
                {}
            }
        });

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

//VALOR DA FATUR AD M~ES PASSADO
  Future<double> getvalorMesP() async {
    double resultMp = 0;
    dynamic datetime = DateTime.now().month;
    if (datetime == 1) {
      datetime = 12;
    } else {
      datetime = datetime - 1;
    }
    await EventosUSerPreference().loadList().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              if (int.parse(value[i].data.split('/')[1]) == datetime)
                {resultMp = resultMp + double.parse(value[i].valor)}
              else
                {}
            }
        });

    return resultMp;
  }

// VALOD DA FATURA DO PROXIMO MÊS
  Future<double> getvalorPmes() async {
    double resultPM = 0;
    var datetime = DateTime.now().month;
    if (datetime == 12) {
      datetime = 1;
    } else {
      datetime++;
    }

    await EventosUSerPreference().loadList().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              if (int.parse(value[i].data.split('/')[1]) == datetime)
                {resultPM = resultPM + double.parse(value[i].valor)}
              else if ((int.parse(value[i].data.split('/')[1]) > datetime))
                {resultPM = resultPM + double.parse(value[i].valor)}
            }
        });

    return resultPM;
  }

  ///percentual do patrimonio

  Future<double> getperc() async {
    double patrimonio = double.parse(DataUser.userData.patrimonio.isEmpty
        ? '0'
        : DataUser.userData.patrimonio);

    var fatura = await SomatoriaValores().getValor();

    double porcent = ((fatura * 100) / patrimonio) / 100;

    return porcent;
  }
}
