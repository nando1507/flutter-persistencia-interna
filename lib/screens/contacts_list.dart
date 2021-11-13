import 'package:bytebank_persistencia/database/app_database.dart';
import 'package:bytebank_persistencia/models/contact.dart';
import 'package:bytebank_persistencia/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  //final List<Contact> _contatos = [];

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
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
        initialData: [],
        future: Future.delayed(const Duration(milliseconds: 250)).then((value) => findAll()),
        builder: (context, snapshot) {
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
                Text('Loading', textDirection: TextDirection.ltr,)
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contact?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactForm();
          }));
          //future.then((newContact) => _atualizaContato(newContact));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

//   void _atualizaContato(Contact? contato) {
//     Future.delayed(const Duration(milliseconds: 250), () {
//       if (contato != null) {
//         setState(() {
//           widget._contatos.add(contato);
//         });
//       }
//     });
//   }
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
