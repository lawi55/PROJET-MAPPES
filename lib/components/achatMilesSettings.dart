import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class AchatMilesSettings extends StatefulWidget {
  final rates;
  final Map currencies;
  const AchatMilesSettings({Key? key, @required this.rates, required this.currencies})
      : super(key: key);

  @override
  _AchatMilesSettingsState createState() => _AchatMilesSettingsState();
}

class _AchatMilesSettingsState extends State<AchatMilesSettings> {
  TextEditingController amountController = TextEditingController();

  String dropdownValue1 = 'TND';
  String dropdownValue2 = 'TND';
  String answer = '1 TND = 1.00 TND';
  double taux = 0;
  double tndvalue = 0;
  double pricedevise = 0;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      // width: w / 3,
      padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Nature des Miles : ", style: TextStyle(fontSize: 19)),
          SizedBox(
            height: 10,
          ),

          //TextFields for Entering USD
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                costumRadio("Miles Prime", 1),
                SizedBox(width: 10),
                costumRadio("Miles Qualifiant", 2)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Prix unitaire en TND : ", style: TextStyle(fontSize: 19)),
              Text(price.toString(), style: TextStyle(fontSize: 19))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Nombre des Miles : ", style: TextStyle(fontSize: 19)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                    child: DropdownButton<String>(
                        value: selectedItem,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        items: miles
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 19))))
                            .toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedItem = item!;
                          });
                          if (selectedItem == '100') {
                            tndprice = price * 100;
                          } else if (selectedItem == '500') {
                            tndprice = price * 500;
                          } else if (selectedItem == '1000') {
                            tndprice = price * 1000;
                          } else if (selectedItem == '2500') {
                            tndprice = price * 2500;
                          } else if (selectedItem == '5000') {
                            tndprice = price * 5000;
                          } else if (selectedItem == '10000') {
                            tndprice = price * 10000;
                          }
                          String s = convertany(widget.rates, '1',
                              dropdownValue1, dropdownValue2);
                          taux = double.parse(s);
                          pricedevise = tndprice / taux;
                        })),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Devise : ", style: TextStyle(fontSize: 19)),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  iconSize: 24,
                  elevation: 16,
                  isExpanded: true,
                  underline: Container(
                    height: 2,
                    color: Colors.grey.shade400,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                      answer = '1' +
                          ' ' +
                          dropdownValue1 +
                          ' = ' +
                          convertany(widget.rates, '1', dropdownValue1,
                              dropdownValue2) +
                          ' ' +
                          dropdownValue2;
                      String s = convertany(
                          widget.rates, '1', dropdownValue1, dropdownValue2);
                      taux = double.parse(s);
                      pricedevise = tndprice / taux;
                    });
                  },
                  items: widget.currencies.keys
                      .toSet()
                      .toList()
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          Container(
              child: Text("   " + answer, style: TextStyle(fontSize: 14))),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              Text("Valeur en devise :       ", style: TextStyle(fontSize: 19)),
              Text(pricedevise.toStringAsFixed(2),
                  style: TextStyle(fontSize: 19))
            ],
          ),

          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text("Valeur en TND :           ",
                  style: TextStyle(fontSize: 19)),
              Text(tndprice.toString(), style: TextStyle(fontSize: 19))
            ],
          ),
        ],
      ),
    );
  }

  int selected = 0;

  Widget costumRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
        if (selected == 1) {
          price = 5;
        } else if ((selected == 2)) {
          price = 10;
        }
        if (selectedItem == '100') {
          tndprice = price * 100;
        } else if (selectedItem == '500') {
          tndprice = price * 500;
        } else if (selectedItem == '1000') {
          tndprice = price * 1000;
        } else if (selectedItem == '2500') {
          tndprice = price * 2500;
        } else if (selectedItem == '5000') {
          tndprice = price * 5000;
        } else if (selectedItem == '10000') {
          tndprice = price * 10000;
        }
        String s =
            convertany(widget.rates, '1', dropdownValue1, dropdownValue2);
        taux = double.parse(s);
        pricedevise = tndprice / taux;
      },
      child: Text(text,
          style: TextStyle(
            color: (selected == index) ? Color(0xFFD80404) : Colors.blueGrey,
          )),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(
            color: (selected == index) ? Color(0xFFD80404) : Colors.blueGrey,
          )),
    );
  }

  String selectedItem = '100';
  double price = 0;
  double tndprice = 0;
  List<String> miles = ['100', '500', '1000', '2500', '5000', '10000'];
}
