import 'package:bytebank_persistencia/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  // const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Contact',
          textDirection: TextDirection.ltr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            TextField(
              controller: _accountNumberController,
              decoration: const InputDecoration(
                labelText: 'Account Number',
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? account =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, account);
                    Navigator.pop(context, newContact);
                  },
                  child: const Text('Create'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

