import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/repositories/module.dart';

import '../../domain/models/todos.dart';

part "module.g.dart";

@riverpod
Future<Todos> todosList(GetTodosRef ref) async {
  final todos = ref.watch(todosProvider);
  final items = await todos.loadTodos();
  return items;
}