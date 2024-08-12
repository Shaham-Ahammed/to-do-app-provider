import 'package:flutter/material.dart';
import 'package:to_do_app_provider/database/db_helper.dart';
import 'package:to_do_app_provider/model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoModel> _todoList = [];
  List<TodoModel> _filteredTodoList = [];

  List<TodoModel> get todoList => _todoList;
  List<TodoModel> get filteredTodoList => _filteredTodoList;

  addData(TodoModel newData) async {
    _todoList.insert(0, newData);

    _filteredTodoList = _todoList;
    await DbHelper.addData(newData.toMap());
    notifyListeners();
  }

  getAllDataFromDb() async {
    final list = await DbHelper.getAllData();
    _todoList = list.map((item) => TodoModel.fromMap(item)).toList();
_filteredTodoList = _todoList;
    notifyListeners();
  }

  makingATodoCompleted(TodoModel todoModel) async {
    todoModel.isCompleted = true;
    await DbHelper.editData(todoModel.id!, todoModel.toMap());
    notifyListeners();
  }

  deletingAtoDoItem(TodoModel todoModel) async {
    _todoList.remove(todoModel);
    _filteredTodoList = _todoList;
    await DbHelper.deleteData(todoModel.id!);
    notifyListeners();
  }

  editTodoItem(TodoModel todoModel, String title, String description) async {
    todoModel.title = title;
    todoModel.description = description;
    await DbHelper.editData(todoModel.id!, todoModel.toMap());
    notifyListeners();
  }

  search(String searchText) {
    if (searchText.isEmpty) {
      _filteredTodoList = _todoList;
    } else {
      _filteredTodoList = _todoList
          .where((todo) =>
              todo.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
