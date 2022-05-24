import 'package:flutter/material.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}
bool namests=false;
bool numbersts=false;

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
            margin: EdgeInsets.all(40),
            child: TextField(
              controller: Name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter your name",
                  errorText: "Please enter valid name",labelText: "Name"),
            ),
          ), Container(
            height: 70,
            width: 200,
            margin: EdgeInsets.all(40),
            child: TextField(
              controller: Number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter your number",
                  errorText: "Please enter valid number",labelText: "Number"),
            ),
          ),
          ElevatedButton(onPressed: () {
            String T1=Name.text;
            String T2=Number.text;

            setState(() {

            });
          }, child:Text("add"))
        ],
      ),
    );
  }

  TextEditingController Name = TextEditingController();
  TextEditingController Number = TextEditingController();

}
