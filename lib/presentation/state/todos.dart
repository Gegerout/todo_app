import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/domain/models/todos.dart';

part 'todos.freezed.dart';
part 'todos.g.dart';

@freezed
class TodosState with _$TodosState {
  const factory TodosState.loading() = _Loading;
  const factory TodosState.ready(Todos todos) = _Loaded;
  const factory TodosState.error({String? message}) = _Error;

  factory TodosState.fromJson(Map<String, dynamic> json) => _$TodosStateFromJson(json);
}