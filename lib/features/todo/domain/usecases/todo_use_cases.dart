import 'package:dartz/dartz.dart';
import 'package:dio_with_clean/core/error/failures.dart';
import 'package:dio_with_clean/features/todo/data/models/todo_model/todo_model.dart';
import 'package:dio_with_clean/features/todo/domain/repositories/todo_repository.dart';

class TodoUseCases {
  TodoUseCases({required TodoRepository repository}) : _repository = repository;
  final TodoRepository _repository;

  Future<Either<Failure, List<TodoModel>>> getTodos() => _repository.getTodos();
  Future<Either<Failure, TodoModel>> getTodo(String id) =>
      _repository.getTodo(id);
}
