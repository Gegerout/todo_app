import '../models/todo.dart';

abstract class GetTodoUseCase {
  Future<Todo?> execute(String id);
}