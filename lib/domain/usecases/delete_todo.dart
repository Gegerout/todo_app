import '../models/todo.dart';

abstract class DeleteTodoUseCase {
  Future<void> execute(Todo todo);
}