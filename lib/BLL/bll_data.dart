import 'package:gano_hesaplama/DAL/Models/ders.dart';
import 'package:gano_hesaplama/DAL/data.dart';

class BllData {
  static double ortalamaHesapla() {
    if (Data.eklenenDersler.isNotEmpty) {
      double notTop = 0.0;
      double krediTop = 0.0;
      for (var item in Data.eklenenDersler) {
        notTop += (item.not.value * item.kredi);
        krediTop += item.kredi;
      }
      Data.setOrtalama = notTop / krediTop;
    } else {
      Data.setOrtalama = 0;
    }
    return Data.getOrtalama;
  }

  static void dersEkle(Ders ders) {
    Data.eklenenDersler.add(ders);
    Data.setGirilenDersAdedi = Data.eklenenDersler.length;
    ortalamaHesapla();
  }

  static void dersSil(int index) {
    Data.eklenenDersler.removeAt(index);
    Data.setGirilenDersAdedi = Data.eklenenDersler.length;
    ortalamaHesapla();
  }

  static void dersleriSifirla() {
    Data.eklenenDersler.clear();
    Data.setGirilenDersAdedi = Data.eklenenDersler.length;
    ortalamaHesapla();
  }
}
