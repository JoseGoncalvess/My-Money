import 'package:shared_preferences/shared_preferences.dart';

///SALVANDO O DAQDOS DO USER NO ARMAZENAMENTO LOCAL
class UserDatePreference {
  String name = '';
  String patrimonio = '';

  saveUserDate({required name, required patrimonio}) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('name', name);
    prefs.setString('patrimonio', patrimonio);
  }
}

///CARREGA OS DADOS QUE FORAM SALVON EM LOCAL
class DataUser {
  static UserData userData = UserData(name: 'name', patrimonio: 'patrimonio');

  Future<UserData> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? "";
    String patrimonio = prefs.getString('patrimonio') ?? "";
//
    return UserData(
      name: name,
      patrimonio: patrimonio,
    );
  }
}

//paRAMETROS A SEREM PASSADOS
class UserData {
  final String name;
  final String patrimonio;

  UserData({
    required this.name,
    required this.patrimonio,
  });
}
