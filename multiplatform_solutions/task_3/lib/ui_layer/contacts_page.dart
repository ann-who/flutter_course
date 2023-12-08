import 'package:flutter/material.dart';
import 'package:task_3/data_source/local_data_source.dart';
import 'package:task_3/ui_layer/widgets/contact_card.dart';

class ContactsPage extends StatelessWidget {
  ContactsPage({super.key});

  final contacts = LocalDataSource().getContacts().keys.toList();
  final avatars = LocalDataSource().getContacts().values.toList();

  String getEmail(String name) {
    var base = name.toLowerCase().replaceAll(' ', '');
    var email = '$base@gmail.com';

    return email;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth > 720
          ? WideLayout(
              avatars: avatars,
              contacts: contacts,
              email: (name) => getEmail(name),
            )
          : NarrowLayout(
              avatars: avatars,
              contacts: contacts,
              email: (name) => getEmail(name),
            ),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({
    super.key,
    required this.avatars,
    required this.contacts,
    required this.email,
  });

  final List<String> avatars;
  final List<String> contacts;
  final Function(String name) email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Adaptive App'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemCount: contacts.length,
        itemBuilder: (context, index) => ContactCard(
          avatar: avatars[index],
          name: contacts[index],
          email: email(contacts[index]),
          isWide: false,
        ),
      ),
    );
  }
}

class WideLayout extends StatelessWidget {
  const WideLayout({
    super.key,
    required this.avatars,
    required this.contacts,
    required this.email,
  });

  final List<String> avatars;
  final List<String> contacts;
  final Function(String name) email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Drawer(
              width: MediaQuery.of(context).size.width * 0.15,
              child: const Text(
                'Adaptive App',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemCount: contacts.length,
                itemBuilder: (context, index) => ContactCard(
                  avatar: avatars[index],
                  name: contacts[index],
                  email: email(contacts[index]),
                  isWide: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
