import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/todos.dart';
import '../../domain/usecases/module.dart';

part "module.g.dart";

@riverpod
Future<Todos> todosList(TodosListRef ref) async {
  final usecase = ref.watch(getTodosProvider);
  final items = await usecase.execute();
  return items;
}