import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/navigation_drawer_widget.dart';
import 'HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() {
    // TODO: implement createState
    return _SignUp();
  }

  const SignUp({Key? Key}) : super(key: Key);
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog(
      {required this.title, required this.content, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

class _SignUp extends State<SignUp> {
  Future addFidelys(
      String firstname,
      String secondname,
      String birthdaydate,
      String email,
      String password,
      String adresse,
      String ville,
      String codepostal,
      String tel,
      String societe,
      String fonction,
      String telpro,
      String fax,
      String sexe,
      String nationalite,
      String cin,
      String typeadhesion,
      String autrefidelisation,
      String idmmbre1,
      String idmmbre2,
      String idmmbre3,
      BuildContext context) async {
    var Url = "http://10.0.2.2:8081/register";
    var res = await http.post(Uri.parse(Url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "firstname": firstname,
          "secondname": secondname,
          "birthdaydate": birthdaydate,
          "email": email,
          "password": password,
          "adresse": adresse,
          "ville": ville,
          "tel": tel,
          "societe": societe,
          "fonction": fonction,
          "codepostal": codepostal,
          "telpro": telpro,
          "fax": fax,
          "sexe": sexe,
          "nationalite": nationalite,
          "cin": cin,
          "typeadhesion": typeadhesion,
          "autrefidelisation": autrefidelisation,
          "idmmbre1": idmmbre1,
          "idmmbre2": idmmbre2,
          "idmmbre3": idmmbre3
        }));
    String responseStr = res.body;
    print(res.body);
    if (res.statusCode == 200) {
      if (res.body == "0") {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            return MyAlertDialog(
                title: "backend response", content: 'Compte deja exist');
          },
        );
      } else {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('id', res.body);
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            return MyAlertDialog(
                title: "backend response", content: 'check mail');
          },
        );
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }
      /*showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: "backend response", content: res.body);
      },
    );*/
      /*Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));*/
    } else {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: "backend response", content: "invalid mail");
        },
      );
    }
  }

  final formKey = GlobalKey<FormState>();
  //editing controller
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final birthadaydateController = TextEditingController();
  final adresseController = TextEditingController();
  final telController = TextEditingController();
  final villeController = TextEditingController();
  final codepostalController = TextEditingController();
  final societeController = TextEditingController();
  final fonctionController = TextEditingController();
  final faxController = TextEditingController();
  final telproController = TextEditingController();
  final sexeController = TextEditingController();
  final natController = TextEditingController();
  final typeadhController = TextEditingController();
  final cinController = TextEditingController();
  final autrefidelController = TextEditingController();
  final idmmbre1Controller = TextEditingController();
  final idmmbre2Controller = TextEditingController();
  final idmmbre3Controller = TextEditingController();
  String _selectedlangue = 'Français';
  @override
  Widget build(BuildContext context) {
    String dropdownValue = '';
    List<String> sexes = ['Homme', 'Femme'];
    List<String> types = ['Adhésion individuelle', 'Adhésion familiale'];

    // String? selectSexe = 'Homme';
    // String? valeur = 'Adhésion individuelle';

    /* final sexe = DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Sexe",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      value: selectSexe,
      isDense: true,
      items: sexes
          .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 17),
              )))
          .toList(),

      /* onChanged: (value) {
          setState(() {
            selectSexe = value.toString();
          });
          print(selectSexe);
        },*/

      onChanged: /*(newValue) {
        (item) => setState(() => selectSexe = newValue.toString());
        print(newValue.toString());
      },*/
          (item) => setState(() => selectSexe = item),
    );*/
    List<String> nationality = [
      'Afghane',
      'Albanaise',
      'Algerienne',
      'Allmande',
      'Améericaine',
      'Angolaise',
      'Antiguaise et Barbudienne',
      'Argentine',
      'Armenienne',
      'Australienne',
      'Autrichienne',
      'Azerbaïdjanaise',
      'Bahamienne',
      'Baherinienne',
      'Bangladaise',
      'Barbadienne',
      'Belge',
      'Beninoise',
      'Bielorusse',
      'Birmane',
      'Bissao-Guineenne',
      'Bolivienne',
      'Bosnienne',
      'Botswanaise',
      'Bresilienne',
      'Britannique',
      'Bruneienne',
      'Bulgare',
      'Burkinabe',
      'Burundaise',
      'Cambodgienne',
      'Camerounaise',
      'Canadienne'
    ];

    final nat = SearchField<String>(
      controller: natController,
      searchInputDecoration: InputDecoration(
        prefixIcon: Icon(
          Icons.language,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Nationality",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      suggestions: nationality
          .map(
            (e) => SearchFieldListItem<String>(
              e.toString(),
              item: e,
            ),
          )
          .toList(),
    );
    final sexe = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Sexe",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(child: Text("--Choisir votre sexe--"), value: ''),
        DropdownMenuItem<String>(child: Text("Homme"), value: 'Homme'),
        DropdownMenuItem<String>(child: Text("Femme"), value: 'Femme'),
      ],
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value.toString();
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },

      /* onChanged: (newValue) {
        (item) => setState(() => selectedItem = newValue.toString());
        print(newValue.toString());
        print(selectedItem);
      }, */
    );
    final Typedadhesion = SearchField<String>(
      controller: typeadhController,
      searchInputDecoration: InputDecoration(
        prefixIcon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Type d'adhesion",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      suggestions: types
          .map(
            (e) => SearchFieldListItem<String>(
              e.toString(),
              item: e,
            ),
          )
          .toList(),
    );
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Nom",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty)
        return 'Champs obligatoire';
        String pattern = r'^[a-z  A-Z]+$';
        if (!RegExp(pattern).hasMatch(value))
        return 'Le nom doit contenir des lettres seulement';
        return null;
      },
    );
    String? level;
    /*final Typedadhesion = DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Sexe",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      value: valeur,
      isDense: true,
      items: types
          .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 17),
              )))
          .toList(),
      onChanged: (item) => setState(() => valeur = item),
    );*/
    final autrefidelisation = TextFormField(
      autofocus: false,
      controller: autrefidelController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        autrefidelController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(50, 30, 50, 30),
        labelText: "Si vous êtes membre d'un autre " +
            '\n' +
            "programme de fidélisation, lequel ?",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final idMmbre1 = TextFormField(
      autofocus: false,
      controller: idmmbre1Controller,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        idmmbre1Controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "N°Identifiant Membre 1",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final idMmbre2 = TextFormField(
      autofocus: false,
      controller: idmmbre2Controller,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        idmmbre2Controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "N°Identifiant Membre 2",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final idMmbre3 = TextFormField(
      autofocus: false,
      controller: idmmbre3Controller,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        idmmbre3Controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "N°Identifiant Membre 3",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        secondNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Prénom",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty)
        return 'Champs obligatoire';
        String pattern = r'^[a-z  A-Z]+$';
        if (!RegExp(pattern).hasMatch(value))
        return 'Le prénom doit contenir des lettres seulement';
        return null;
      },
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: mailController,
      keyboardType: TextInputType.emailAddress,
      autofillHints: [AutofillHints.email],
      validator: (value) {
        if (value == null || value.isEmpty)
        return 'Champs obligatoire';
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value))
        return 'Saisir un e-mail valide';
        return null;
      },
      onSaved: (value) {
        mailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "E-mail",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final AdresseField = TextFormField(
      autofocus: false,
      controller: adresseController,
      //obscureText: true,

      onSaved: (value) {
        adresseController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.home,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Adresse domicile",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty)
        return 'Champs obligatoire';
        return null;
      },
    );
    final ville = TextFormField(
      autofocus: false,
      controller: villeController,
      //obscureText: true,

      onSaved: (value) {
        villeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.location_city,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Ville",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty)
        return 'Champs obligatoire';
        String pattern = r'^[a-z  A-Z]+$';
        if (!RegExp(pattern).hasMatch(value))
        return 'Le prénom doit contenir des lettres seulement';
        return null;
      },
    );
    final codePostalField = TextFormField(
      autofocus: false,
      controller: codepostalController,
      //obscureText: true,

      keyboardType: TextInputType.number,
      onSaved: (value) {
        codepostalController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.markunread_mailbox,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Code postal",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty)
        return 'Champs obligatoire';
        String pattern = r'^[0-9]+$';
        if (!RegExp(pattern).hasMatch(value))
        return 'Saisir un code postal valide';
        return null;
      },
    );
    final numeroField = TextFormField(
      autofocus: false,
      controller: telController,
      //obscureText: true,

      keyboardType: TextInputType.phone,
      onSaved: (value) {
        telController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Numéro de téléphone",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final faxField = TextFormField(
      autofocus: false,
      controller: faxController,
      //obscureText: true,

      keyboardType: TextInputType.phone,
      onSaved: (value) {
        faxController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Fax",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final societeField = TextFormField(
      autofocus: false,
      controller: societeController,
      //obscureText: true,

      onSaved: (value) {
        societeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.factory_outlined,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Société",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final fonctionField = TextFormField(
      autofocus: false,
      controller: fonctionController,
      //obscureText: true,

      onSaved: (value) {
        fonctionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.wallet_travel,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Fonction",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final telproField = TextFormField(
      autofocus: false,
      controller: telproController,
      //obscureText: true,

      keyboardType: TextInputType.phone,
      onSaved: (value) {
        telproController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Tél Professionnel",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final CinField = TextFormField(
      autofocus: false,
      controller: cinController,
      //obscureText: true,

      keyboardType: TextInputType.phone,
      onSaved: (value) {
        cinController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.credit_card,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "N°Passeport ou CIN",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[R]*[0-9]{7}+$').hasMatch(value!)) {
          return "Nom doit contenir des lettres seulement";
        } else {
          return null;
        }
      },
    );
    //confrimPassword
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      //validator
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "  Password",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final dateFlied = TextFormField(
      controller: birthadaydateController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.event_note,
          color: Colors.red,
        ),
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Date de naissance',
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                1910), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime.now());
        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            birthadaydateController.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^[0-9]{2}*[-]*[0-9]{2}*[-]*[19]*[0-9]{2}+$')
                .hasMatch(value!)) {
          return "Saisir un date de naissance correct";
        } else {
          return null;
        }
      },
    );
    final SignUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(80),
      color: Colors.red[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              addFidelys(
                  firstNameController.text,
                  secondNameController.text,
                  birthadaydateController.text,
                  mailController.text,
                  passwordController.text,
                  adresseController.text,
                  villeController.text,
                  codepostalController.text,
                  telController.text,
                  societeController.text,
                  fonctionController.text,
                  telproController.text,
                  faxController.text,
                  sexeController.text,
                  natController.text,
                  cinController.text,
                  typeadhController.text,
                  autrefidelController.text,
                  idmmbre1Controller.text,
                  idmmbre2Controller.text,
                  idmmbre3Controller.text,
                  context);
            }
          },
          child: Text(
            "S'inscrire",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Informations personnelles",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      firstNameField,
                      SizedBox(
                        height: 25,
                      ),
                      secondNameField,
                      SizedBox(
                        height: 25,
                      ),
                      sexe,
                      SizedBox(
                        height: 25,
                      ),

                      dateFlied,
                      SizedBox(
                        height: 25,
                      ),
                      emailField,
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CinField,
                      SizedBox(
                        height: 25,
                      ),
                      nat,
                      SizedBox(
                        height: 25,
                      ),
                      Text("Adresse et contact",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,

                      ),
                      SizedBox(
                        height: 20,
                      ),

                      AdresseField,
                      SizedBox(
                        height: 25,
                      ),
                      ville,
                      SizedBox(
                        height: 25,
                      ),
                      codePostalField,
                      SizedBox(
                        height: 25,
                      ),
                      numeroField,
                      SizedBox(
                        height: 25,
                      ),
                    

                      Text("Informations professionnelles",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,

                      ),
                       SizedBox(
                        height: 20,
                      ),
                      societeField,
                      SizedBox(
                        height: 25,
                      ),
                      fonctionField,
                      SizedBox(
                        height: 25,
                      ),
                      telproField,
                      SizedBox(
                        height: 25,
                      ),
                      faxField,
                      SizedBox(
                        height: 25,
                      ),
                      Text("Caractéristiques de l'adhésion",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Typedadhesion,
                      SizedBox(
                        height: 25,
                      ),

                      autrefidelisation,
                      SizedBox(
                        height: 25,
                      ),
                      idMmbre1,
                      SizedBox(
                        height: 25,
                      ),
                      idMmbre2,
                      SizedBox(
                        height: 25,
                      ),
                      idMmbre3,
                      SizedBox(
                        height: 25,
                      ),

                      

                      const Text('Langue de communication:'),
                      ListTile(
                        leading: Radio<String>(
                          activeColor: Colors.red[800],
                          value: 'Français',
                          groupValue: _selectedlangue,
                          onChanged: (value) {
                            setState(() {
                              _selectedlangue = value!;
                            });
                          },
                        ),
                        title: const Text('Français'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          activeColor: Colors.red[800],
                          value: 'English',
                          groupValue: _selectedlangue,
                          onChanged: (value) {
                            setState(() {
                              _selectedlangue = value!;
                            });
                          },
                        ),
                        title: const Text('English'),
                      ),
                      //comfirmpasswordField,
                      SignUpButton,

                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

