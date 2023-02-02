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

  saveEvento(evento, data, valor, tag, pag, alert) {
    eventosC.add(Evento(
        evento: evento,
        data: data,
        valor: valor,
        tag: tag,
        pag: pag,
        alert: alert));
  }

  List<Evento> eventosC = [];
  int contList = 0;

//metodo que efetua o salvamento do item an lista
  Future saveItemList(Evento evento) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    contList++;

    //salavdno os caracteres do evento
    sharedPreferences.setString(
        'item_evento_name_${evento.evento.length}', evento.evento);
    sharedPreferences.setString(
        'item_evento_data_${evento.evento.length}', evento.data);
    sharedPreferences.setString(
        'item_evento_valor_${evento.evento.length}', evento.valor);
    sharedPreferences.setString(
        'item_evento_pag_${evento.evento.length}', evento.pag);
    sharedPreferences.setString(
        'item_evento_tag_${evento.evento.length}', evento.tag);
    sharedPreferences.setString(
        'item_evento_alert_${evento.evento.length}', evento.alert);
//salvadmp o conter da lista
    sharedPreferences.setInt('conterList', contList);
  }

  ///função qu carrega  aa lsita coms o eventos salvos anteriormente
  Future<List<Evento>> loadList() async {
    List<Evento> getList = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int conterlist = sharedPreferences.getInt('conterList') ?? 0;

//o for efetua o loop buscando os eventos pelo numeor do indice passado pelo i
    for (var i = 0; i < conterlist; i++) {
      String evento =
          sharedPreferences.getString('item_evento_name_${eventosC.length}') ??
              '';
      String valor =
          sharedPreferences.getString('item_evento_valor_${eventosC.length}') ??
              '';
      String data =
          sharedPreferences.getString('item_evento_data_${eventosC.length}') ??
              '';
      String pag =
          sharedPreferences.getString('item_evento_pag_${eventosC.length}') ??
              '';
      String tag =
          sharedPreferences.getString('item_evento_tag_${eventosC.length}') ??
              '';
      String alert =
          sharedPreferences.getString('item_evento_alert_${eventosC.length}') ??
              '';

      getList.add(Evento(
          evento: evento,
          data: data,
          valor: valor,
          tag: tag,
          pag: pag,
          alert: alert));
    }
    return getList;
  }
}
/*
class EventoUser {
  Future<Eventos> loadEventoUser() async {
    final prefs = await SharedPreferences.getInstance();
    String evento = prefs.getString('evento') ?? "";
    String data = prefs.getString('data') ?? "";
    String valor = prefs.getString('valor') ?? "";
    String tag = prefs.getString('tag') ?? "";
    String pag = prefs.getString('pag') ?? "";
    String alert = prefs.getString('alert') ?? "";

    return Eventos(
        alert: alert,
        valor: valor,
        data: data,
        pag: pag,
        tag: tag,
        evento: evento);
  }
}


/*
  Future saveEvntoUser({evento, data, valor, tag, pag, alert}) async {
    final presf = await SharedPreferences.getInstance();
    presf.setString('evento', evento);
    presf.setString('dara', data);
    presf.setString('valor', valor);
    presf.setString('tag', tag);
    presf.setString('pag', pag);
    presf.setString('alert', alert);
  }
*/
*/