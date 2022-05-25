import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper{
 Future<Database> datacollect() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'phnebook.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
        });
    return database;
  }
  insertdata(String name,String number,Database database)
  {
    String insert="insert into database (NAME,NUMBER) values('$name','$number')";

    int cnt;
  }
}