import 'package:flutter/material.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "new contact",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            width: 200,
            margin: EdgeInsets.all(60),
            child: TextField(
              controller: Name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              hintText: "enter your name"),

            ),
          )
        ],
      ),
    );
  }

  TextEditingController Name = TextEditingController();
}
