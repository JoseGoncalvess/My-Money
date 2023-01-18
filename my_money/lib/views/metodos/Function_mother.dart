class Year {
  final List<String> meses = [
    "Janeiro",
    "fevereiro",
    "Março",
    "Abril",
    "Mail",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];

  nextMother() {
    for (String proxmes in meses) {
      print(proxmes);
    }
  }
}
