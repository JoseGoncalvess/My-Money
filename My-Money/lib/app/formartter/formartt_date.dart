class FormartterDate {
  String formartterdate(DateTime date) {
    String data = date.toString().split(' ').first;
    String day = data.split('-').last;
    String month = data.split('-')[1];
    String yaer = data.split('-').first;

    return '$day/$month/$yaer';
  }

  formaterdataparcel(String data, int i) {
    String day = data.split('/').first;
    String month = data.split('/')[1];
    String yaer = data.split('/').last;
    int intmonth = int.parse(month) + i;
    if (intmonth == 12) {
      intmonth = 1;
    } else {
      intmonth = intmonth;
    }
    month = intmonth.toString();

    return '$day/$month/$yaer';
  }
}
