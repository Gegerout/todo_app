import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:todo_app/presentation/view/home.dart';
import 'package:todo_app/presentation/view/todos_list.dart';

final router = GoRouter(
  initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const Home(),
        redirect: (context, state) => '/todos',
        routes: [
          GoRoute(
            path: 'todos',
            builder: (context, state) => const TodosList()
          )
        ]
      ),
    ]
);