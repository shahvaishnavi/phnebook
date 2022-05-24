import 'package:flutter/material.dart';
import 'package:phonebook/secondpage.dart';

void main() {
  runApp(MaterialApp(
    home: contactbook(),
  ));
}

class contactbook extends StatefulWidget {
  const contactbook({Key? key}) : super(key: key);

  @override
  State<contactbook> createState() => _contactbookState();
}

class _contactbookState extends State<contactbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return secondpage();
            },
          ));
        },
      ),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Contactbook",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
