import 'package:flutter/material.dart';
import 'package:to_do_app_provider/model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final List<TodoModel> _todoList = [];
  List<TodoModel> _filteredTodoList = [];

  List<TodoModel> get todoList => _todoList;
  List<TodoModel> get filteredTodoList => _filteredTodoList;

  addData(TodoModel newData) {
    _todoList.insert(0, newData);
    _filteredTodoList = _todoList;
    notifyListeners();
  }

  makingATodoCompleted(TodoModel todoModel) {
    todoModel.isCompleted = true;
    notifyListeners();
  }

  deletingAtoDoItem(TodoModel todoModel) {
    _todoList.remove(todoModel);
    _filteredTodoList = _todoList;
    notifyListeners();
  }

  editTodoItem(TodoModel todoModel, String title, String description) {
    todoModel.title = title;
    todoModel.description = description;
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
