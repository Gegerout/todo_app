import 'package:todo_app/domain/repositories/todos.dart';

import '../models/todos.dart';
import 'get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  final TodosRepository todosRepository;

  GetTodosUseCaseImpl(this.todosRepository);

  @override
  Future<Todos> execute() => todosRepository.loadTodos();
}