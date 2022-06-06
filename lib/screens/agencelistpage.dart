import 'package:currency_flutter/screens/selectedagencepage.dart';
import 'package:currency_flutter/screens/worldmap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/utils.dart';
import '../model/Agence.dart';

import '../widgets/agencycard.dart';
import '../widgets/iconfont.dart';
import '../widgets/navigation_drawer_widget.dart';

class AgenceListPage extends StatelessWidget {
  List<Agence> agences = Utils.getMockedAgences();
  @override
  Widget build(BuildContext context) {
    final button = FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorldMap()),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Color(0xFFD80404),
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Text('Agence Tunisair dans le monde',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)));
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xFFD80404),
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Acceuil",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.flight),
              label: "Vols",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              label: "Fidelys",
            ),
          ],
        ),
        drawer: NavigationDrawerWidget(),
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
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text('Liste des agences:',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black)),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: agences.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return AgencyCard(
                      agence: agences[index],
                      onCardClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectedAgencePage(
                                    mapurl: agences[index].mapurl)));
                      },
                    );
                  }),
            ),
            button,
          ],
        )));
  }
}
