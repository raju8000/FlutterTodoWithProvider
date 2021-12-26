import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/providers/todos_notifier.dart';
import 'package:todos/widgets/todo_list_view.dart';

class AllTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allTodos = Provider.of<TodoNotifier>(context).allTodos;
    return Container(
      child: TodoListView(todos: allTodos,),
    );
  }
}
