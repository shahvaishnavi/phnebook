import 'package:flutter/material.dart';
import 'package:phonebook/Dbhelper.dart';
import 'package:phonebook/secondpage.dart';
import 'package:sqflite/sqflite.dart';

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
  Database?Db;
  List<Map> userdata = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    database();
  }

  void database() {
    Dbhelper().datacollect().then((value) {
      setState(() {
        Db = value;
        Dbhelper().viewdata(Db!).then((listofmap) {
          setState(() {
            userdata = listofmap;
          });
        },);
      });
    });
  }

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
      body: ListView.builder(
        itemCount: userdata.length, itemBuilder: (context, index) {
        return Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            shadowColor: Colors.indigo,
            child: ListTile(trailing: PopupMenuButton(onSelected: ((value) {

            }), itemBuilder: (context) {
              return [PopupMenuItem(value: 0, child: Text("delete"), onTap: () {
                int Id = userdata[index]['ID'];
                Dbhelper.deletedata(Id, Db!).then((value) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) {
                      return contactbook();
                  },));
                });
              },),
              PopupMenuItem(value: 1,child: Text("update"),onTap:(){
                int Id =userdata[index]['ID'];
                Dbhelper().updatedata();
              },)
              ];
            },),
        subtitle: Text("${userdata[index]['CONTACT']}"),
        title: Text("${userdata[index]['NAME']}"),
        leading: Text("${userdata[index]['ID']}"),),
        );
        },),
    );
  }


}
