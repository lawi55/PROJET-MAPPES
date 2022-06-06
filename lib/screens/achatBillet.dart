import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class AchatBillet extends StatefulWidget {
  const AchatBillet({Key? key}) : super(key: key);

  @override
  State<AchatBillet> createState() => _AchatBilletState();
}

class _AchatBilletState extends State<AchatBillet> {
  int _value = 0;
  List<String> villes = [
    'Abidjan',
    'Alger',
    'Amman',
    'Amesterdam',
    'Bâle',
    'Bamako',
    'Barcelone',
    'Benghazi',
    'Berlin',
    'Bologne',
    'Bordeaux',
    'Bruxelles',
    'Casablanca',
    'Conakry',
    'Constantine',
    'Cotonou',
    'Dakar',
    'Djerba',
    'Dubai',
    'Duesseldorf',
    'Enfidha',
    'Frankfurt',
    'Gabes',
    'Gafsa',
    'Genève',
    'Hamburg',
    'Istanbul',
    'Jeddah',
    'Le Caire',
    'Lille',
    'Lisbonne',
    'Londres',
    'Lyon',
    'Madrid',
    'Malte',
    'Marseille',
    'Médine',
    'Milan',
    'Monastir',
    'Montréal',
    'Munich',
    'Nantes',
    'Naples',
    'Niamey',
    'Nice',
    'Nouakchott',
    'Oran',
    'Ouagadougou',
    'Palerme',
    'Paris',
    'Prague',
    'Rome',
    'Sfax',
    'Strasbourg',
    'Tabarka',
    'Toulouse',
    'Tozeur',
    'Tripoli',
    'Tunis',
    'Venise',
    'Vérone',
    'Vienne',
    'Zurich'
  ];
  List<String> voyageurs = ['un voyageurs ','deux voyageurs','trois voyageurs','3 voyageurs' ,'4 voyageurs','5 voyageurs','6 voyageurs'];
  String voyageur = '0 voyageurs';
  String ville1 = 'Tunis';
  String ville2 = 'Paris';
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFD80404),
          title: Container(
            padding: EdgeInsets.all(25),
            child: Image.asset(
              "assets/images/tunisair.png",
              height: 60,
            ),
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Achat d'une billet Prime",
                      style: TextStyle(fontSize: 25, fontFamily: 'ElMessiri')),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type de voyage :",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = 1;
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Aller simple",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        SizedBox(
                          width: 40,
                        ),
                        Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = 2;
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Aller retour",
                            style: TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Départ :",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: DropdownButton<String>(
                          value: ville1,
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.grey.shade400,
                          ),
                          items: villes
                              .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child:
                                      Text(item, style: TextStyle(fontSize: 19))))
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              ville1 = item!;
                            });
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Destination :",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: DropdownButton<String>(
                          value: ville2,
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.grey.shade400,
                          ),
                          items: villes
                              .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child:
                                      Text(item, style: TextStyle(fontSize: 19))))
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              ville2 = item!;
                            });
                          }),
                    ),
                    Row(
                      children: [
                        Text("Vol départ :",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                            SizedBox(width: 10,),
                            Container(
                              width: 250,
                              child: TextFormField(
                                controller: _date,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.calendar_today_rounded),
                                ),
                                onTap: () async {
                                  DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                    if (pickeddate != null) {
                                      setState(() {
                                        _date.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                                      });
                                    }
                                }

                              ),
                            ),
                       
                      ],
                    ),
                    Row(
                      children: [
                        Text("Vol retour : ",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                            SizedBox(width: 10,),
                            Container(
                              width: 250,
                              child: TextFormField(
                                controller: _date,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.calendar_today_rounded), 
                                ),
                                onTap: () async {
                                  DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                    if (pickeddate != null) {
                                      setState(() {
                                        _date.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                                      });
                                    }
                                }

                              ),
                            ),
                       
                      ],
                    ),
                    Text("Voyageurs :",
                        style: TextStyle(
                          fontSize: 18,
                        )),
    
       
                  ],
                  
                )
              ],
            ),
          ),
        ),
      
    );
  }
}
