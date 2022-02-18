import 'package:flutter/material.dart';
import 'package:gano_hesaplama/PL/const.dart';

class DersAdi extends StatefulWidget {
  DersAdi({Key? key}) : super(key: key);

  @override
  State<DersAdi> createState() => DersAdiState();
}

class DersAdiState extends State<DersAdi> {
  final formKey = GlobalKey<FormState>();

  String currentValue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          maxLength: 25,
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: Const.borderRadius,
              borderSide: BorderSide.none,
            ),
            contentPadding: Const.inputPadding,
            filled: true,
            fillColor: Const.appSecColor,
          ),
          style: TextStyle(
            color: Const.textColor,
            decoration: TextDecoration.none,
          ),
          validator: (String? val) {
            if (val != null && val.isEmpty) {
              return "Lütfen ders adını giriniz.";
            }
            return null;
          },
          onSaved: (String? val) {
            currentValue = val ?? "";
          },
        ),
      ),
    );
  }
}
