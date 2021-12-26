import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/models/todo_model.dart';
import 'package:todos/providers/todos_notifier.dart';
import 'package:todos/widgets/todo_list_view.dart';

class CompleteTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Todo> completeTodos = Provider.of<TodoNotifier>(context).completeTodos;

    return Container(
        child: TodoListView(
          todos: completeTodos,
        )
    );
  }
}
