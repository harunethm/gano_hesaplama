import 'package:flutter/material.dart';
import 'package:gano_hesaplama/PL/const.dart';

class DropDown extends StatefulWidget {
  final List<String> listitems;
  final List<double> listvalues;

  const DropDown({required this.listitems, required this.listvalues, Key? key})
      : super(key: key);

  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDown> {
  late List<DropdownMenuItem> items;
  Map<String, double> currItem = {"": 0};
  // double currentItem = 0;

  @override
  void initState() {
    items = [];
    for (int i = 0; i < widget.listitems.length; i++) {
      items.add(
        DropdownMenuItem(
          child: Text(
            widget.listitems[i],
            style: TextStyle(color: Colors.white), // when expanded
          ),
          value: <String, double>{widget.listitems[i]: widget.listvalues[i]},
        ),
      );
    }
    // currentItem = items.first.value;
    currItem = items.first.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: DropdownButtonHideUnderline(child: Container()),
      alignment: Alignment.center,
      dropdownColor: Const.appMainColor,
      iconEnabledColor: Const.appMainColor,
      style: TextStyle(
        color: Const.appMainColor,
      ),
      menuMaxHeight: 400,
      isDense: true,
      borderRadius: Const.borderRadius,
      value: currItem,
      items: items,
      selectedItemBuilder: (context) {
        return widget.listitems.map(
          (String val) {
            return Text(
              val,
              style: TextStyle(color: Const.appMainColor), // when closed
            );
          },
        ).toList();
      },
      onChanged: <String, double>(val) {
        setState(() {
          currItem = val;
        });
      },
    );
  }
}
