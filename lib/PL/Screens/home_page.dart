import 'package:flutter/material.dart';
import 'package:gano_hesaplama/BLL/bll_data.dart';
import 'package:gano_hesaplama/DAL/Models/ders.dart';
import 'package:gano_hesaplama/DAL/data.dart';
import 'package:gano_hesaplama/PL/Widgets/bilgi.dart';
import 'package:gano_hesaplama/PL/Widgets/ders_adi.dart';
import 'package:gano_hesaplama/PL/Widgets/dropdown.dart';
import 'package:gano_hesaplama/PL/Widgets/liste.dart';
import 'package:gano_hesaplama/PL/const.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final keyListe = GlobalKey<ListeState>();
  final keyBilgi = GlobalKey<BilgiState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "ORTALAMA HESAPLA",
          style: Const.textStyleBase(fontWeight: FontWeight.w900, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Hesap(
                  keyListe,
                  keyBilgi,
                ),
              ),
            ),
            Expanded(
              child: Liste(
                keyBilgi,
                key: keyListe,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Const.appSecColor,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                BllData.dersleriSifirla();
                keyListe.currentState!.setState(() {});
                keyBilgi.currentState!.setState(() {});
              },
              color: Const.appMainColor,
              disabledColor: Const.appSecColor,
              icon: Icon(Icons.clear),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                "Temizle",
                style: TextStyle(color: Const.appMainColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Hesap extends StatefulWidget {
  final GlobalKey<ListeState> keyListe;
  final GlobalKey<BilgiState> keyBilgi;

  const Hesap(this.keyListe, this.keyBilgi, {Key? key}) : super(key: key);

  @override
  State<Hesap> createState() => HesapState();
}

class HesapState extends State<Hesap> {
  final keyDersAdi = GlobalKey<DersAdiState>();
  final keyDersNotu = GlobalKey<DropDownState>();
  final keyDersKredisi = GlobalKey<DropDownState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              DersAdi(
                key: keyDersAdi,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: DropDown(
                        key: keyDersNotu,
                        listitems: Data.notlar.keys.toList(),
                        listvalues: Data.notlar.values.toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: DropDown(
                        key: keyDersKredisi,
                        listitems: List.generate(
                          Const.maxKredi.toInt(),
                          (index) => (index + 1).toString(),
                        ),
                        listvalues: List.generate(
                          Const.maxKredi.toInt(),
                          (index) => (index + 1),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.check_rounded,
                        color: Const.appMainColor,
                      ),
                      onPressed: () {
                        String _dersAdi;
                        MapEntry<String, double> _dersNotu;
                        double _dersKredisi;

                        if (keyDersAdi.currentState != null &&
                            keyDersKredisi.currentState != null &&
                            keyDersNotu.currentState != null) {
                          GlobalKey<FormState> formKey =
                              keyDersAdi.currentState!.formKey;
                          if (formKey.currentState != null) {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              _dersAdi = keyDersAdi.currentState!.currentValue;

                              _dersNotu = MapEntry(
                                  keyDersNotu.currentState!.currItem.keys.first,
                                  keyDersNotu
                                      .currentState!.currItem.values.first);

                              _dersKredisi = keyDersKredisi
                                  .currentState!.currItem.values.first;

                              Ders ders = Ders(
                                  ad: _dersAdi,
                                  not: _dersNotu,
                                  kredi: _dersKredisi.toInt());

                              BllData.dersEkle(ders);
                              widget.keyListe.currentState!.setState(() {});
                            }
                          }
                        }

                        setState(() {});
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Bilgi(
            key: widget.keyBilgi,
          ),
        ),
      ],
    );
  }
}
