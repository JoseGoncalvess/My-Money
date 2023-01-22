import 'package:shared_preferences/shared_preferences.dart';

class ListEvento {
  final String evento;
  final String data;
  final String valor;
  final String tag;
  final String pag;
  final String alert;

  ListEvento({
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

  Future saveEvntoUser({evento, data, valor, tag, pag, alert}) async {
    final presf = await SharedPreferences.getInstance();
    presf.setString('evento', evento);
    presf.setString('dara', data);
    presf.setString('valor', valor);
    presf.setString('tag', tag);
    presf.setString('pag', pag);
    presf.setString('alert', alert);
  }
}

class EventoUser {
  Future<ListEvento> loadEventoUser() async {
    final prefs = await SharedPreferences.getInstance();
    String evento = prefs.getString('evento') ?? "";
    String data = prefs.getString('data') ?? "";
    String valor = prefs.getString('valor') ?? "";
    String tag = prefs.getString('tag') ?? "";
    String pag = prefs.getString('pag') ?? "";
    String alert = prefs.getString('alert') ?? "";

    return ListEvento(
        alert: alert,
        valor: valor,
        data: data,
        pag: pag,
        tag: tag,
        evento: evento);
  }
}
