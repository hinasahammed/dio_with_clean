import 'dart:developer';

import 'package:dio_with_clean/features/todo/data/models/todo_model/todo_model.dart';
import 'package:dio_with_clean/features/todo/domain/usecases/todo_use_cases.dart';
import 'package:dio_with_clean/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_provider.g.dart';

class HomeState {
  HomeState({required this.todos});
  final List<TodoModel> todos;

  HomeState copyWith({List<TodoModel>? todos}) {
    return HomeState(todos: todos ?? this.todos);
  }
}

@riverpod
class TodosProvider extends _$TodosProvider {
  late TodoUseCases _todoUseCases;
  @override
  HomeState build() {
    _todoUseCases = ref.watch(todoUseCasesProvider);
    return HomeState(todos: []);
  }

  Future<void> getTodos() async {
    final result = await _todoUseCases.getTodos();
    result.fold(
      (failure) => log(failure.message),
      (response) => state = state.copyWith(todos: response),
    );
  }
}
