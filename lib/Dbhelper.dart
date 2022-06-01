import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  Future<Database> datacollect() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'phnebook.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'Create table phnebook (Id integer primary key autoincrement ,NAME text, CONTACT text)');
    });
    return database;
  }

 Future<void> insertdata(String T1, String T2, Database database) async {
    String insert =
        "insert into phnebook (NAME,CONTACT) values('$T1','$T2')";

    int cnt = await database.rawInsert(insert);
    print(cnt);
  }

  Future<List<Map>> viewdata(Database database) async {
    String select="select * from phnebook";
    List<Map> list=await database.rawQuery(select);

    print("======$list");
    return list;
  }

    static Future<void> deletedata(int Id,Database database) async {
    String delete="delete from phnebook where ID = ('$Id')";
    await database.rawDelete(delete);
    return Future.value();
  }

  Future<void> updatedata(String newname,String newnumber,int ID,Database database) async {
  String update="update from phnebook set NAME ='$newname',NUMBER='$newnumber',where id='ID'";
  await database.rawUpdate(update);
  return Future.value();
  }

}
