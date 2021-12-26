import 'package:flutter/material.dart';
import 'package:todos/models/todo_model.dart';
import 'dart:collection';

class TodoNotifier with ChangeNotifier{
  List<Todo> _todos = [
    Todo(title: 'Todo One'),
    Todo(title: 'Todo Two'),
    Todo(title: 'Todo Three'),
    Todo(title: 'Todo four'),
  ];

  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(_todos);

  UnmodifiableListView<Todo> get inCompleteTodos => UnmodifiableListView(_todos.where((Todo todo) {
    return todo.completed == false;
  }));

  UnmodifiableListView<Todo> get completeTodos => UnmodifiableListView(_todos.where((Todo todo) {
    return todo.completed == true;
  }));

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    final todoIndex = _todos.indexOf(todo);

    _todos[todoIndex].toggleCompleted();
    notifyListeners();
  }

}