import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/domain/repositories/todos.dart';

import 'get_todo.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  final TodosRepository todosRepository;

  GetTodoUseCaseImpl(this.todosRepository);

  @override
  Future<Todo?> execute(String id) => todosRepository.getTodoById(id);
}