import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //refernce the box
  final _myBox = Hive.box('mybox');

  // run this method when first time openning app
  void createInitialData() {
    toDoList = [];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  // update the database
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
