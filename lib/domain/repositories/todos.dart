import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/domain/models/todos.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);

  Future<Todo?> getTodoById(String id);

  Future<void> deleteAllTodos();
}