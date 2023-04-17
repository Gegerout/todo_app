import 'package:todo_app/domain/models/todos.dart';

abstract class GetTodosUseCase {
  Future<Todos> execute();
}