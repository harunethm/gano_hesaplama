import 'package:flutter/material.dart';
import 'package:gano_hesaplama/DAL/data.dart';
import 'package:gano_hesaplama/PL/const.dart';

class Bilgi extends StatefulWidget {
  Bilgi({Key? key}) : super(key: key);

  @override
  State<Bilgi> createState() => BilgiState();
}

class BilgiState extends State<Bilgi> {
  @override
  Widget build(BuildContext context) {
    final int dersSayisi = Data.getGirilenDersAdedi;
    final double ortalama = Data.getOrtalama;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Ortalama;",
          style: Const.textStyleBase(),
        ),
        Text(
          ortalama.toStringAsFixed(2),
          style: Const.textStyleBase(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "${dersSayisi} ders girildi.",
          style: Const.textStyleBase(),
        ),
      ],
    );
  }
}
