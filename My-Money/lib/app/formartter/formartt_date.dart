class FormartterDate {
  String formartterdate(DateTime date) {
    String data = date.toString().split(' ').first;
    String day = data.split('-').last;
    String month = data.split('-')[1];
    String yaer = data.split('-').first;

    return '$day/$month/$yaer';
  }
}
