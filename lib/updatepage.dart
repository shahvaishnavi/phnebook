import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class updatepage extends StatefulWidget {
  const updatepage({Key? key}) : super(key: key);

  @override
  State<updatepage> createState() => _updatepageState();
}
bool namests=false;
bool numbersts=false;
Database?Db;

class _updatepageState extends State<updatepage> {
  @override
  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "new contact",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            width: 250,
            child: TextField(
              controller: newname,
              decoration: InputDecoration(
                labelText: "NAME",
                errorText: namests?"PLEASE ENTER YOUR NAME":null,
                hintText: "ADD NAME",
                border: OutlineInputBorder(),
              ),),),
          Container(
            height: 70,
            width: 250,
            child: TextField(
              controller: newname,
              decoration: InputDecoration(
                labelText: "NUMBER",
                errorText: numbersts?"PLEASE ENTER YOUR NUMBER":null,
                hintText: "ADD NUMBER",
                border: OutlineInputBorder(),
              ),
            ),),
          ElevatedButton(onPressed: () {

          }, child: Text("add data"))
        ],
      ),
    );
  }

  TextEditingController newname = TextEditingController();
  TextEditingController newnumber = TextEditingController();
}
