import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/pages/add_todo_page.dart';
import 'package:todos/pages/all_todos_page.dart';
import 'package:todos/pages/complite_todos_page.dart';
import 'package:todos/pages/incompelet_todos_page.dart';
import 'package:todos/providers/todos_notifier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoNotifier(),
      child: MaterialApp(
        title: 'Flutter Todo',
        theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
        home: MyHomePage(
          title: 'Todo App',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTodoPage()));
                },
                icon: Icon(Icons.add),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Complete',
                ),
                Tab(
                  text: 'In Complete',
                ),
              ],
            ),
            title: Text(widget.title),
          ),
          body: TabBarView(
            children: [
              AllTodos(),
              CompleteTodos(),
              InCompleteTodos(),
            ],
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}