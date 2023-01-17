import 'package:basic_flutter/ContactPage.dart';
import 'package:flutter/material.dart';
import './Contact.dart';
import 'package:azlistview/azlistview.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// สร้าง widget แบบ Stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My App",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage());
  }
}

// สร้าง widget แบบ Stateful
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // group data
  List<Contact> contacts = allContacts;

  @override
  Widget build(BuildContext context) {
    List<Contact> sortedContacts = List.from(contacts)
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return Scaffold(
        appBar: AppBar(title: Text("Contact", style: TextStyle(fontSize: 20))),
        body: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 246, 246, 246)),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 40, right: 20, bottom: 20, left: 20),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.0)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: searchContact,
                    )),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = sortedContacts[index];

                  return ListTile(
                    leading: Image.asset(contact.img),
                    title: Text("${contact.name} (${contact.nickname})"),
                    subtitle: Text(contact.position),
                  );
                },
              ),
            ),
          ],
        ));
  }

  void searchContact(String query) {
    final suggestions = allContacts.where((contact) {
      final contactName = contact.name.toLowerCase();
      final input = query.toLowerCase();

      return contactName.contains(input);
    }).toList();
    setState(() {
      contacts = suggestions;
    });
  }
}
