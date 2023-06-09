import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseTask {
  late Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {

    }
  }
  Future createDatabase()async{
    Directory directory = await getApplicationDocumentsDirectory();
    String database_directory = join(directory.path,'database.db');
    var bdd = await openDatabase(database_directory,version: 2,onCreate: );
    return bdd;
  }
  Future _onCreate(Database db, int version)
}
