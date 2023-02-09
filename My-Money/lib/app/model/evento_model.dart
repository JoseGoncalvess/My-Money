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

  Future saveEvento({
    required evento,
    required data,
    required valor,
    required tag,
    required pag,
    required alert,
  }) async {
    Evento item = Evento(
        evento: evento,
        data: data,
        valor: valor,
        tag: tag,
        pag: pag,
        alert: alert);

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    contList = sharedPreferences.getInt('contList') ?? 0;
    int i = contList;

    saveItemList(item, i);
  }

  List<Evento> eventosC = [];
  int contList = 0;

//metodo que efetua o salvamento do item an lista
  Future saveItemList(Evento evento, int index) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    contList++;

    //salavdno os caracteres do evento
    sharedPreferences.setString('item_evento_name_$index', evento.evento);
    sharedPreferences.setString('item_evento_data_$index', evento.data);
    sharedPreferences.setString('item_evento_valor_$index', evento.valor);
    sharedPreferences.setString('item_evento_pag_$index', evento.pag);
    sharedPreferences.setString('item_evento_tag_$index', evento.tag);
    sharedPreferences.setString('item_evento_alert_$index', evento.alert);
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
      String evento = sharedPreferences.getString('item_evento_name_$i') ?? '';
      String valor = sharedPreferences.getString('item_evento_valor_$i') ?? '';
      String data = sharedPreferences.getString('item_evento_data_$i') ?? '';
      String pag = sharedPreferences.getString('item_evento_pag_$i') ?? '';
      String tag = sharedPreferences.getString('item_evento_tag_$i') ?? '';
      String alert = sharedPreferences.getString('item_evento_alert_$i') ?? '';

      getList.add(
        Evento(
            evento: evento,
            data: data,
            valor: valor,
            tag: tag,
            pag: pag,
            alert: alert),
      );
    }
    return getList;
  }
}
