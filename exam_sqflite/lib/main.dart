import 'package:exam_sqflite/model/Todo.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManger {
  // Singleton
  DatabaseManger._(); // private construnctor
  static final DatabaseManger instance = DatabaseManger._();

  static const _dbName = "todo.db";
  static const _dbVersion = 1;
  static const _table = 'todo';
  Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _getDatabaseInstance();
    return _db!;
  }

  _getDatabaseInstance() async {
    String dbPath = join(await getDatabasesPath(), _dbName);
    print(dbPath);
    return openDatabase(dbPath, onCreate: ((db, version) => db.execute("""
        CREATE TABLE todo(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT,
          isDone INTEGER,
          excutedTime TEXT
        )
      """)), version: _dbVersion);
  }

  void generateTestData() {
    for (var i = 1; i <= 5; i++) {
      insert(Todo(id: i, title: "Title of ${i.toString()}").toMap());
    }
  }

  Future<void> insert(Map<String, dynamic> todo) async {
    final db = await instance.db;

    db.insert(_table, todo);
  }

  Future<List<Todo>> todos({int isDone = 0}) async {
    final db = await instance.db;

    final List<Map<String, dynamic>> todos =
        await db.query('todo', where: 'isDone = ?', whereArgs: [isDone]);

    return todos.map((e) => Todo.fromMap(e)).toList();
  }
}

void main() async {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final DatabaseManger todoDB;

  @override
  void initState() {
    super.initState();
    todoDB = DatabaseManger.instance;
    todoDB.generateTestData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('미리알림'),
          actions: const [
            Icon(Icons.menu_open_sharp),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Icon(Icons.check_box_outline_blank_outlined),
                title: Text('title bla bla bla'),
                subtitle: Text('sub title bla bla bla'),
              );
            })),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () => print('add'),
          elevation: 5,
        ),
      ),
    );
  }
}
