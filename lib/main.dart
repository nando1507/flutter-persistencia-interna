import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(const Bytebank());
  // save(Contact(0, 'Bareno', 500));//.then((id){
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
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700]),
      ),
      home: const Dashboard(),
      // home: const ContactList(),
    );
  }
}

