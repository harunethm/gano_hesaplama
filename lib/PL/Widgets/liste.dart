import 'package:flutter/material.dart';
import 'package:gano_hesaplama/DAL/data.dart';
import 'package:gano_hesaplama/PL/Widgets/bilgi.dart';
import 'package:gano_hesaplama/PL/const.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Liste extends StatefulWidget {
  final GlobalKey<BilgiState> keyBilgi;

  const Liste(this.keyBilgi, {Key? key}) : super(key: key);

  @override
  ListeState createState() => ListeState();
}

class ListeState extends State<Liste> {
  // editString(String str) {
  //   str = str.toLowerCase();
  //   List list = str.split(" ");
  //   for (var element in list) {
  //     element = element[0].toString().toUpperCase() +
  //         (element as String).substring(1, element.length);
  //   }
  //   str = list.join(" ");
  //   return str;
  // }

  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      radius: Radius.circular(24),
      trackVisibility: false,
      child: Data.eklenenDersler.isNotEmpty
          ? ListView.builder(
              itemCount: Data.eklenenDersler.length,
              itemBuilder: (context, index) {
                String _dersAdi = Data.eklenenDersler[index].not.key.toString();
                // return Card(
                //   margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                //   shape:
                //       RoundedRectangleBorder(borderRadius: Const.borderRadius),
                //   color: Const.appSecColor,
                //   elevation: 16,
                //   shadowColor: Const.appMainColor,
                //   child: ListTile(
                //     dense: true,
                //     leading: CircleAvatar(
                //       child: Text(
                //         _dersAdi,
                //       ),
                //     ),
                //     title: Text(
                //       Data.eklenenDersler[index].ad.toString(),
                //     ),
                //     subtitle: Text(
                //       "Dersin kredisi: " +
                //           Data.eklenenDersler[index].kredi.toString(),
                //     ),
                //   ),
                // );
                return Slidable(
                  closeOnScroll: true,
                  endActionPane: ActionPane(
                    extentRatio: .3,
                    motion: ScrollMotion(),
                    children: [
                      // SlidableAction(
                      //   // An action can be bigger than the others.
                      //   // flex: 1,
                      //   onPressed: (context) {
                      //     BllData.dersSil(index);
                      //     setState(() {});
                      //     widget.keyBilgi.currentState!.setState(() {});
                      //   },
                      //   backgroundColor: Const.appSecColor,
                      //   foregroundColor: Const.appMainColor,
                      //   icon: Icons.delete,
                      //   label: 'Delete',
                      // ),
                      // SlidableAction(
                      //   onPressed: (context) {},
                      //   backgroundColor: Color(0xFF0392CF),
                      //   foregroundColor: Colors.white,
                      //   icon: Icons.save,
                      //   label: 'Save',
                      // ),

                      // CustomSlidableAction(
                      //   onPressed: (context) {},
                      //   child: Text("test"),
                      // ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Slidable.of(context)?.close();
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Const.appSecColor,
                            primary: Const.appMainColor,
                            onSurface: Const.appMainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            side: BorderSide.none,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.delete,
                                ),
                                Text("Dersi Sil"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: Const.borderRadius),
                    color: Const.appSecColor,
                    elevation: 0,
                    // shadowColor: Const.appMainColor,
                    child: ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        child: Text(
                          _dersAdi,
                        ),
                      ),
                      title: Text(
                        Data.eklenenDersler[index].ad.toString(),
                      ),
                      subtitle: Text(
                        "Dersin kredisi: " +
                            Data.eklenenDersler[index].kredi.toString(),
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text("Listede hiç ders yok."),
            ),
    );
  }
}
