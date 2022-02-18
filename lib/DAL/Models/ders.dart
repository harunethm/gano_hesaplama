class Ders {
  String ad = "";
  MapEntry<String, double> not;
  int kredi = 0;

  Ders({
    required this.ad,
    required this.not,
    required this.kredi,
  });

  @override
  String toString() {
    return "Ders adı: $ad, Ders notu: ${not.key}, Ders kredisi: $kredi";
  }
}
