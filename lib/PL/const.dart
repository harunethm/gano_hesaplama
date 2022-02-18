import 'package:flutter/material.dart';
import 'package:gano_hesaplama/PL/Widgets/ders_adi.dart';
import 'package:gano_hesaplama/PL/Widgets/dropdown.dart';

class Const {
  static const appMainColor = Colors.purple;
  static final appSecColor = Colors.purple.shade100.withOpacity(.4);
  static final textColor = Colors.purple.shade900;
  static const borderRadius = BorderRadius.all(Radius.circular(24));
  static const inputPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const maxKredi = 40.0;
  static TextStyle textStyleBase({FontWeight? fontWeight, double? fontSize}) =>
      TextStyle(
        color: appMainColor,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontSize: fontSize ?? 14,
      );
}
