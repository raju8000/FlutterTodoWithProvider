import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/models/todo_model.dart';
import 'package:todos/providers/todos_notifier.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todos;

  const TodoListView({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(todos[index].title),
          leading: Checkbox(
              value: todos[index].completed,
              onChanged: (bool checked) {
                Provider.of<TodoNotifier>(context,listen: false).toggleTodo(todos[index]);
              }),
          trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                Provider.of<TodoNotifier>(context,listen: false).deleteTodo(todos[index]);
              }),
        ),
        itemCount: todos.length,
      ),
    );
  }
}
