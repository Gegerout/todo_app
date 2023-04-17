import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:todo_app/data/sources/files.dart';
import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/domain/models/todos.dart';
import 'package:todo_app/domain/repositories/todos.dart';

class TodosRepositoryImpl extends TodosRepository {
  final Files files;
  late final String path = 'todos.json';

  TodosRepositoryImpl(this.files);

  @override
  Future<void> deleteAllTodos() async {
    // TODO: implement deleteAllTodos
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todos = await loadTodos();

    final newTodos = todos.values.where((t) => t.id == todo.id).toList();
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<Todos> loadTodos() async {
    final content = await files.read(path);
    if(content == null) return const Todos(values: []);

    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();

    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();

    final existing = todos.values.firstWhereOrNull((t) => t.id == todo.id);
    if (existing != null) {
      final newTodo = existing.copyWith(
        title: todo.title,
        description: todo.description,
        completed: todo.completed,
      );
      final newTodos = todos.values.map((t) {
        return t.id == todo.id ? newTodo : t;
      }).toList();
      await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
      return;
    } else {
      final newTodos = [...todos.values, todo];
      await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
    }
  }
}