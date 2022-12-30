import 'package:shared_preferences/shared_preferences.dart';

class UserDatePreference {
  String name = '';
  String patrimonio = '';

  saveUserDate(name, patrimonio) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('name', name);
    prefs.setString('patrimonio', patrimonio);

    print(name);
    print(patrimonio + "$name");
  }
}

class DataUser {
  Future<UserData> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? "";
    String patrimonio = prefs.getString('patrimonio') ?? "";

    return UserData(
      name: name,
      patrimonio: patrimonio,
    );
  }
}

class UserData {
  final String name;
  final String patrimonio;

  UserData({
    required this.name,
    required this.patrimonio,
  });
}
