import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/todo.dart';
import '../../domain/models/todos.dart';
import '../../domain/usecases/module.dart';

//final todosListNotifier = ChangeNotifierProvider<ValueNotifier<Todos>>((ref)  => ValueNotifier(const Todos(values: [])));

class TodosStateNotifier extends StateNotifier<Todos> {
  TodosStateNotifier(this.ref) : super(const Todos(values: [])) {
    loadTodos();
  }

  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }

  Future<void> save(Todo todo) async {
    await ref.read(saveTodoProvider).execute(todo);
    await loadTodos();
  }

  Future<Todo?> get(String id) async {
    return await ref.read(getTodoProvider).execute(id);
  }

  List<Todo> getCompletedTodos() {
    return state.values.where((todo) => todo.completed).toList();
  }
  List<Todo> getActiveTodos() {
    return state.values.where((todo) => !todo.completed).toList();
  }

}

final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>((ref) {
  return TodosStateNotifier(ref);
});

final todosListModel = Provider<TodosStateNotifier>((ref) {
  return ref.watch(todosListState.notifier);
});