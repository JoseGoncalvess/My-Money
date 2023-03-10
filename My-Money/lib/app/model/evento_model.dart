import 'dart:convert';
import 'dart:developer';

import 'package:my_money/app/formartter/formartt_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Evento {
  final String evento;
  final String data;
  final String valor;
  final String tag;
  final String pag;
  final String alert;

  Evento({
    required this.evento,
    required this.data,
    required this.valor,
    required this.tag,
    required this.pag,
    required this.alert,
  });
}

///SALVANDO O DAQDOS DO USER NO ARMAZENAMENTO LOCAL
class EventosUSerPreference {
  String evento = '';
  String data = '';
  String valor = '';
  String tag = '';
  String pag = '';
  String alert = '';
  int parcela = 0;

  Future saveEvento(
      {required evento,
      required data,
      required valor,
      required tag,
      required pag,
      required alert,
      required parcela}) async {
    Evento item = Evento(
        evento: evento,
        data: data,
        valor: valor,
        tag: tag,
        pag: pag,
        alert: alert);

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    contList = sharedPreferences.getInt('conterList') ?? 0;
    int index = contList;

    saveItemList(item, index, parcela);
  }

  List<Evento> eventosC = [];
  int contList = 0;

//metodo que efetua o salvamento do item an lista
  Future saveItemList(Evento evento, int index, int parcela) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    log('conterList $contList');
    // int numparcel = parcela;

    eventosC.add(Evento(
        evento: evento.evento,
        data: data,
        valor: valor,
        tag: tag,
        pag: pag,
        alert: alert));

    sharedPreferences.setString('lista_eventos', eventosC.toString());

//     //para SALVAR MULTIPLOS ELE PRECISAR TER O INDEXPAG = 2
//     if (evento.pag == "2") {
//       //PRECISA TER TAMVEM O NUMRO D EPARCELAS MAIOR QUE 2
//       if (numparcel > 1) {
//         for (var i = 0; i < numparcel; i++) {
//           index = contList;
//           contList++;

//           //DESCOBRI COMO ALTERA O VALOR DO MES E PASSAR PRA FUN????O
//           data = FormartterDate().formaterdataparcel(evento.data, i);

//           //salavdno os caracteres do evento
//           sharedPreferences.setString('item_evento_name_$index', evento.evento);
//           sharedPreferences.setString('item_evento_data_$index', data);
//           sharedPreferences.setString('item_evento_valor_$index', evento.valor);
//           sharedPreferences.setString('item_evento_pag_$index', evento.pag);
//           sharedPreferences.setString('item_evento_tag_$index', evento.tag);
//           sharedPreferences.setString('item_evento_alert_$index', evento.alert);
// //salvadmp o conter da lista
//           sharedPreferences.setInt('conterList', contList);
//           log(contList.toString());
//         }
//       } else {
//         contList++;
//         //salavdno os caracteres do evento
//         sharedPreferences.setString('item_evento_name_$index', evento.evento);
//         sharedPreferences.setString('item_evento_data_$index', evento.data);
//         sharedPreferences.setString('item_evento_valor_$index', evento.valor);
//         sharedPreferences.setString('item_evento_pag_$index', evento.pag);
//         sharedPreferences.setString('item_evento_tag_$index', evento.tag);
//         sharedPreferences.setString('item_evento_alert_$index', evento.alert);
// //salvadmp o conter da lista
//         sharedPreferences.setInt('conterList', contList);
//         log(contList.toString());
//       }
//     } else {
//       contList++;
//       //salavdno os caracteres do evento
//       sharedPreferences.setString('item_evento_name_$index', evento.evento);
//       sharedPreferences.setString('item_evento_data_$index', evento.data);
//       sharedPreferences.setString('item_evento_valor_$index', evento.valor);
//       sharedPreferences.setString('item_evento_pag_$index', evento.pag);
//       sharedPreferences.setString('item_evento_tag_$index', evento.tag);
//       sharedPreferences.setString('item_evento_alert_$index', evento.alert);
// //salvadmp o conter da lista
//       sharedPreferences.setInt('conterList', contList);
//       log(contList.toString());
//     }

//     log('item_evento_name_$index ${evento.evento}');
//     log('item_evento_data_$index ${evento.data}');
//     log('item_evento_valor_$index ${evento.valor}');
//     log('item_evento_pag_$index ${evento.pag}');
//     log('item_evento_tag_$index ${evento.tag}');
//     log('item_evento_alert_$index ${evento.alert}');
// //salvadmp o conter da lista
  }

  ///fun????o qu carrega  aa lsita coms o eventos salvos anteriormente
  Future<List<Evento>> loadList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int conterlist = sharedPreferences.getInt('conterList') ?? 0;
    List<Evento> getList = [];

    String lista = sharedPreferences.getString('lista_eventos') ?? '';
//o for efetua o loop buscando os eventos pelo numeor do indice passado pelo i
    // for (var i = 0; i < conterlist; i++) {
    //   String evento = sharedPreferences.getString('item_evento_name_$i') ?? '';
    //   String valor = sharedPreferences.getString('item_evento_valor_$i') ?? '';
    //   String data = sharedPreferences.getString('item_evento_data_$i') ?? '';
    //   String pag = sharedPreferences.getString('item_evento_pag_$i') ?? '';
    //   String tag = sharedPreferences.getString('item_evento_tag_$i') ?? '';
    //   String alert = sharedPreferences.getString('item_evento_alert_$i') ?? '';

    //   getList.add(
    //     Evento(
    //         evento: evento,
    //         data: data,
    //         valor: valor,
    //         tag: tag,
    //         pag: pag,
    //         alert: alert),
    //   );
    // }
    return getList = jsonDecode(lista);
  }

//deletando o item atraves do index
  Future deletItemList(int index) async {
    log('O Index Quando chega na fun????o ?? $index');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    int contList = sharedPreferences.getInt('conterList') ?? 0;
    log(' o contlist ?? $contList');
//essa peste tava apagando minhas coisa
    if (contList >= 1) {
      contList--;
      //deletando os caracteres do evento
      sharedPreferences.remove('item_evento_name_$index');
      sharedPreferences.remove('item_evento_data_$index');
      sharedPreferences.remove('item_evento_valor_$index');
      sharedPreferences.remove('item_evento_pag_$index');
      sharedPreferences.remove('item_evento_tag_$index');
      sharedPreferences.remove('item_evento_alert_$index');
//salvadmp o conter da lista
      sharedPreferences.setInt('conterList', contList);
      log(' Agora o contlist ?? $contList');
    } else {
      log('Erro ao exluir o item da lista');
    }
  }
}
