import 'package:to_do_app_provider/database/db_helper.dart';

class TodoModel {
  final int? id;
  String title;
  String description;
  bool isCompleted;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      DbHelper.id: id,
      DbHelper.title: title,
      DbHelper.description: description,
      DbHelper.isCompleted: isCompleted ? 1 : 0, // Convert bool to int for SQLite
    };
  }

  // Factory constructor to create a TodoModel instance from a map
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map[DbHelper.id],
      title: map[DbHelper.title],
      description: map[DbHelper.description],
      isCompleted: map[DbHelper.isCompleted] == 1, // Convert int back to bool
    );
  }
}
