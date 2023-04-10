import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/presentation/viewmodel/module.dart';

class TodosList extends ConsumerWidget {
  const TodosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: ref.watch(getTodosProvider).map(
          data: (todos) => ListView.builder(
            itemCount: todos.value.values.length,
            itemBuilder: (context, index) {
              final todo = todos.value.values[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: todo.description != null ? Text(todo.description!) : null,
              );
            },
          ),
          error: (error) => Center(
            child: Text(error.stackTrace.toString()),
          ),
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('todos/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
