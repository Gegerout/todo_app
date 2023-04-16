import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shortid/shortid.dart';
import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/domain/usecases/module.dart';

class TodosNew extends ConsumerStatefulWidget {
  const TodosNew({Key? key}) : super(key: key);

  @override
  ConsumerState<TodosNew> createState() => _TodosNewState();
}

class _TodosNewState extends ConsumerState<TodosNew> {
  final _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final description = TextEditingController();
  late final saveTodo = ref.read(saveTodoProvider);
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(labelText: "Title"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: description,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
                CheckboxListTile(
                    title: const Text("Completed"),
                    value: isCompleted,
                    onChanged: (value) {
                      if (mounted) {
                        setState(() {
                          isCompleted = value!;
                        });
                      }
                    })
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            final todo = Todo(
                id: shortid.generate(),
                title: title.text,
                description: description.text,
                completed: isCompleted);

            final messenger = ScaffoldMessenger.of(context);
            final router = GoRouter.of(context);

            await saveTodo.execute(todo);
            messenger.toast("Todo saved");
            if(router.canPop()) router.pop();
          }
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}

extension on ScaffoldMessengerState {
  void toast(String message) {
    showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
