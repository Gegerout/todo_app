import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/repositories/todos_impl.dart';
import 'package:todo_app/data/sources/module.dart';
import 'package:todo_app/domain/repositories/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodosRepositoryImpl(ref.read(filesProvider));
});