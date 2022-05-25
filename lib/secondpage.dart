import 'package:flutter/material.dart';
import 'package:phonebook/Dbhelper.dart';
import 'package:sqflite/sqflite.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();

}

bool namests=false;
bool numbersts=false;


class _secondpageState extends State<secondpage> {
  Database?Db;

  @override

  @override
  void initState() {
  super.initState();
  getdata();
  }
  void getdata() {

  }

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
                  errorText: namests?"Please enter valid name":null,labelText: "Name"),
            ),
          ), Container(
            height: 70,
            width: 200,
            margin: EdgeInsets.all(40),
            child: TextField(keyboardType: TextInputType.number,
              controller: Number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter your number",
                  errorText: numbersts?"ENTER YOUR VALID NUMBER":null,labelText: "Number"),
            ),
          ),
          ElevatedButton(onPressed: () {
            String T1=Name.text;
            String T2=Number.text;

              namests=false;
              numbersts=false;

            setState(() {
             if(T1.isEmpty)
               {
                 namests=true;
               }
             if(T2.isEmpty)
                 {
                   numbersts=true;
                 }
             else{
               Dbhelper().insertdata(T1, T2,Db!);
             }
            });

            print("====NAME===$T1");
            print("====NUMBER===$T2");

          }, child:Text("add"))
        ],
      ),
    );
  }

  TextEditingController Name = TextEditingController();
  TextEditingController Number = TextEditingController();


}