import 'package:gano_hesaplama/DAL/Models/ders.dart';

class Data {
  static int _girilenDersAdedi = 0;
  static double _ortalama = 0.0;

  static get getGirilenDersAdedi => _girilenDersAdedi;
  static set setGirilenDersAdedi(girilenDersAdedi) =>
      _girilenDersAdedi = girilenDersAdedi;

  static get getOrtalama => _ortalama;
  static set setOrtalama(value) => _ortalama = double.parse("$value");

  static List<Ders> eklenenDersler = [];

  static Map<String, double> notlar = {
    "AA": 4,
    "BA": 3.5,
    "BB": 3,
    "CB": 2.5,
    "CC": 2,
    "DC": 1.5,
    "DD": 1,
    "FF": 0,
  };
}
