import '../models/todo.dart';

abstract class GetTodosUseCase {
  Future<void> execute();
}