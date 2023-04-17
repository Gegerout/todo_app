import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/presentation/viewmodel/module.dart';
import 'package:todo_app/presentation/widgets/extensions.dart';

class TodosList extends ConsumerWidget {
  const TodosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosListState);
    final model = ref.watch(todosListModel);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Todos"),
      ),
      body: ListView.builder(
            itemCount: todos.values.length,
            itemBuilder: (context, index) {
              final todo = todos.values[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: todo.description != null ? Text(todo.description!) : null,
                // value: todo.completed,
                // onChanged: (value) async {
                //   if(value != null) {
                //     final newTodo = todo.copyWith(completed: value);
                //     await model.save(newTodo);
                //   }
                // },
                onTap: () {
                  context.push('/todos/${todo.id}');
                },
              );
            },
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/todos/new');
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Todo"),
        tooltip: "Add todo",
      ),
    );
  }
}
