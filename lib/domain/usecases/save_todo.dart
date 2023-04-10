import '../models/todo.dart';

abstract class SaveTodoUseCase {
  Future<void> execute(Todo todo);
}