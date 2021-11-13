import 'package:bytebank_persistencia/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const String tableContactSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER '
      ')';





  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);

    // return getDatabase().then((db) {
    //   final Map<String, dynamic> contactMap = Map();
    //   //contactMap['id'] = contact.id;
    //   contactMap['name'] = contact.name;
    //   contactMap['account_number'] = contact.accountNumber;
    //   return db.insert('contacts', contactMap);
    // });
  }

  Map<String, dynamic> _toMap(Contact contact) {
      final Map<String, dynamic> contactMap = {};
    //contactMap['_id'] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tableName);
    List<Contact> contacts = _toList(resultado);
    return contacts;
    // return getDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contact> contacts = [];
    //     for (Map<String, dynamic> map in maps) {
    //       final Contact contact = Contact(
    //         map['id'],
    //         map['name'],
    //         map['account_number'],
    //       );
    //       contacts.add(contact);
    //     }
    //     return contacts;
    //   });
    // });
  }

  List<Contact> _toList(List<Map<String, dynamic>> resultado) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in resultado) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}