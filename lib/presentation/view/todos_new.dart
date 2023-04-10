import 'package:flutter/material.dart';

class TodosNew extends StatelessWidget {
  const TodosNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: const Center(
        child: Text("Add Todo"),
      ),
    );
  }
}
