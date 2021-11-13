
import 'package:bytebank_persistencia/database/dao/contact_dao.dart';
import 'package:bytebank_persistencia/models/contact.dart';
import 'package:bytebank_persistencia/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  //final List<Contact> _contatos = [];

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          textDirection: TextDirection.ltr,
        ),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: Future.delayed(const Duration(milliseconds: 250)).then((id) => _dao.findAll()),
        builder: (context, snapshot) {
          // switch(snapshot.connectionState){
          //   case ConnectionState.none:
          //     // TODO: Handle this case.
          //     break;
          //   case ConnectionState.waiting:
          //     // TODO: Handle this case.
          //     break;
          //   case ConnectionState.active:
          //     // TODO: Handle this case.
          //     break;
          //   case ConnectionState.done:
          //     // TODO: Handle this case.
          //     break;
          // }
          if (snapshot.data != null) {
            final List<Contact> contatos = snapshot.data as List<Contact>;
            return ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, indice) {
                final contacts = contatos[indice];
                return ItemContato(contacts);
              },
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                CircularProgressIndicator(),
                Text(
                  'Loading',
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          )
              .then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemContato extends StatelessWidget {
  final Contact _contact;

  const ItemContato(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          _contact.name,
        ),
        subtitle: Text(
          _contact.accountNumber.toString(),
        ),
      ),
    );
  }
}
