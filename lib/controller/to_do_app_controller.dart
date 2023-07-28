import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/view/screens/page1.dart';
import 'package:new_app/view/screens/page2.dart';
import 'package:new_app/view/screens/page3.dart';
import 'package:sqflite/sqflite.dart';

class ToDoAppController extends GetxController {
  int currentIndex = 0;
  bool isLoading=true;
  bool isBottomSheetOpened = false;
  TextEditingController taskController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late Database database;
  List<Map> newTasks = [], doneTasks = [], archivedTasks = [];
  late List<Map> allTasks;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List screens = [
    New(),
    Done(),
    Archived(),
  ];

  int changeBottomIndex(int index) {
    currentIndex = index;
    update();
    return index;
  }

  void iconChange() {
    isBottomSheetOpened = !isBottomSheetOpened;
    update();
  }

  void createDB() async {
    // open the database
    await openDatabase('db.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db
          .execute(
              'CREATE TABLE Tasks(id INTEGER PRIMARY KEY, name TEXT,time TEXT, date TEXT, status TEXT)')
          .then((value) {
        print("Database is created successfully");
      }).catchError((error){
        print("error while creating !!!!");
      });
    }, onOpen: (Database db) {
          print("Database is opened successfully");
    }).then((value){
      database =value;
      getData(value);
    });
  }

   insertData({required String name,required String time,required String date}) async {
    // Insert some records in a transaction
    return await database.transaction((txn) async {
       await txn.rawInsert(
          'INSERT INTO Tasks(name, time, date , status ) VALUES("$name", "$time", "$date","new")').then((value){
         print('inserted: $value Successfully');
         getData(database);
      }).catchError((error){
        print("Error while Inserting");
       });
    });
  }

  void updateData({required String status, required int id}) async {
    // Update some record
     await database
        .rawUpdate('UPDATE Tasks SET status = ? WHERE id = ?', [status, '$id']).then((value){
       getData(database);
       print("Updated Successfully !!!");
     }).catchError((error){
       print("Error while Updating");
     });
  }

  void getData(Database db) async {
    // Get the records
    await database.rawQuery('SELECT * FROM Tasks').then((value) {
      isLoading=true;
      newTasks = [];
      doneTasks = [];
      archivedTasks = [];
      for (var element in value) {
        if (element["status"] == "new") {
          newTasks.add(element);
        } else if (element["status"] == "done") {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      }
      isLoading=false;
      update();
    }).catchError((error){
      print("Error while Getting Data");
    });
  }

  void deleteData({required int id}) async {
    // Delete a record
    await database
        .rawDelete('DELETE FROM Tasks WHERE id = ?', ['$id']).then((value) {
      print("$value deleted successfully");
      getData(database);
    }).catchError((onError){
      print("Error while Deleting");
    });
  }
}
