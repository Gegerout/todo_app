import 'package:todo_app/domain/repositories/todos.dart';

import 'get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  final TodosRepository todosRepository;

  GetTodosUseCaseImpl(this.todosRepository);

  @override
  Future<void> execute() => todosRepository.loadTodos();
}