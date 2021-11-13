import 'package:bytebank_persistencia/database/app_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';
import 'screens/contacts_list.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const Bytebank());
   save(Contact(0, 'Bareno', 500));//.then((id){
  //   findAll().then((contacts) => debugPrint(contacts.toString()));
  // });
}

class Bytebank extends StatelessWidget {
  const Bytebank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Dashboard(),
      // home: const ContactList(),
    );
  }
}

