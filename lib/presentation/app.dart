import 'package:flutter/material.dart';
import 'package:todo_app/presentation/router.dart';

class TodosApp extends StatelessWidget {
  const TodosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.green;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Todos",
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ThemeData.light(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: color, brightness: Brightness.light)),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: color, brightness: Brightness.dark)),
      themeMode: ThemeMode.system,
    );
  }
}
