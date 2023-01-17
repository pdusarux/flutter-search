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
        theme: ThemeData(primarySwatch: Colors.deepPurple),
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
  List<Contact> contact = [
    Contact("Adam Live", "Adam", "UX/UI Designer", "assets/images/img1.png"),
    Contact("Adam Rally", "Rally", "UX/UI Designer", "assets/images/img4.png"),
    Contact("BA Gala", "Gaga", "UX/UI Designer", "assets/images/img1.png"),
    Contact("BB Jally", "Jall", "UX/UI Designer", "assets/images/img4.png"),
    Contact("Cany Kit", "Candy", "UX/UI Designer", "assets/images/img2.png"),
    Contact("Cally Lim", "Call", "UX/UI Designer", "assets/images/img3.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My App", style: TextStyle(fontSize: 20))),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Contact mem = contact[index];
            return ListTile(
              leading: Image.asset(mem.img),
              title: Text("${mem.name} (${mem.nickname})",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Text(mem.position, style: TextStyle(fontSize: 10)),
              onTap: () {
                print("Contact:>" + mem.name);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactPage(mem)));
              },
            );
          },
          itemCount: contact.length,
        ));
  }
}
