import 'package:basic_flutter/ContactPage.dart';
import 'package:flutter/material.dart';
import './Contact.dart';

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
    String previousLetter = "";

    return Scaffold(
        appBar: AppBar(title: Text("Contact", style: TextStyle(fontSize: 20))),
        body: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 246, 246, 246)),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 30, right: 20, bottom: 20, left: 20),
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
                  String currentLetter = contact.name[0];
                  if (currentLetter != previousLetter) {
                    previousLetter = currentLetter;
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 40, bottom: 10, left: 40),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(currentLetter,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          // Return the contact
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactPage(contact)),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Image.asset(contact.img),
                                    title: Text(
                                        "${contact.name} (${contact.nickname})",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    subtitle: Text(contact.position,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Return the contact if the current contact's first letter is the same as the previous contact's first letter
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 40, bottom: 10, left: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ContactPage(contact)),
                                );
                              },
                              child: ListTile(
                                leading: Image.asset(contact.img),
                                title: Text(
                                    "${contact.name} (${contact.nickname})",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                subtitle: Text(contact.position,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // return Padding(
                  //   padding: const EdgeInsets.all(20),
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //           alignment: Alignment.topLeft, child: Text("A")),
                  //       InkWell(
                  //           onTap: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => ContactPage(contact)),
                  //             );
                  //           },
                  //           child: ListTile(
                  //             leading: Image.asset(contact.img),
                  //             title: Text(
                  //                 "${contact.name} (${contact.nickname})",
                  //                 style:
                  //                     TextStyle(fontWeight: FontWeight.w600)),
                  //             subtitle: Text(contact.position,
                  //                 style:
                  //                     TextStyle(fontWeight: FontWeight.w500)),
                  //           )),
                  //       Divider(
                  //         color: Colors.grey,
                  //       ),
                  //     ],
                  //   ),
                  // );
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
