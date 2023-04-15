import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/domain/repositories/todos.dart';
import 'package:todo_app/domain/usecases/delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  final TodosRepository todosRepository;

  DeleteTodoUseCaseImpl(this.todosRepository);

  @override
  Future<void> execute(Todo todo) async {
    await todosRepository.deleteTodo(todo);
  }
}