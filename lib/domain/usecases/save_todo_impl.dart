import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/domain/repositories/todos.dart';

import 'save_todo.dart';

class SaveTodoUseCaseImpl extends SaveTodoUseCase {
  final TodosRepository todosRepository;

  SaveTodoUseCaseImpl(this.todosRepository);

  @override
  Future<void> execute(Todo todo) async {
    await todosRepository.saveTodo(todo);
  }
}