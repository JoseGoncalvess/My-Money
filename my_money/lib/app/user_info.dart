import 'package:shared_preferences/shared_preferences.dart';

class UserDatePreference {
  String name = '';
  String patrimonio = '';

  saveUserDate() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('name', name);
    prefs.setString('name', patrimonio);
    print('name:');
  }

  loadUsarDate() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    patrimonio = prefs.getString('patrimonio') ?? '';
  }
}
