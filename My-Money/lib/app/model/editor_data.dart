import 'package:my_money/app/model/evento_model.dart';
import 'package:my_money/app/model/metodos/Function_mother.dart';

class EditorData {
  dateEvent(data) {
    int mes = int.parse(data.split('/')[1]);
    if (mes == 1) {
      return 'JANEIRO';
    } else if (mes == 2) {
      return 'FEVEREIRO';
    } else if (mes == 3) {
      return 'MARÇO';
    } else if (mes == 4) {
      return 'ABRIL';
    } else if (mes == 5) {
      return 'MAIL';
    } else if (mes == 6) {
      return 'JUNHO';
    } else if (mes == 7) {
      return 'JULHO';
    } else if (mes == 8) {
      return 'AGOSTO';
    } else if (mes == 9) {
      return 'SETEMBRO';
    } else if (mes == 10) {
      return 'OUTRUBRO';
    } else if (mes == 11) {
      return 'NOVEMBRO';
    } else if (mes == 12) {
      return 'DEZEMBRO';
    } else {
      return null;
    }
  }
}
