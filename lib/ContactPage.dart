import 'package:basic_flutter/Contact.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final Contact contact;

  ContactPage(this.contact);
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Contact")),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-3, 3),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, right: 20, left: 20),
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              contact.img,
                              height: 70,
                              width: 70,
                            )),
                      ),
                      _buildTextColumn("Name", contact.name),
                      _buildTextColumn("Position", contact.position),
                      _buildTextColumn("Department", contact.department),
                      _buildTextColumn("Email", contact.email),
                      _buildTextColumn("Tel", contact.tel),
                      _buildTextColumn("Ext.", contact.ext),
                      _buildTextColumn(
                          "Social Media ID", contact.socialMediaId),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _buildTextColumn(String title, String value) {
  return Column(
    children: [
      Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
        child: Column(
          children: [
            Container(alignment: Alignment.topLeft, child: Text(title)),
            Container(
              alignment: Alignment.topLeft,
              child: Text(value,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    ],
  );
}
