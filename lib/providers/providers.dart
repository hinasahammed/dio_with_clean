import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio_with_clean/core/network/apiService/api_service.dart';
import 'package:dio_with_clean/core/network/apiService/api_service_impl.dart';
import 'package:dio_with_clean/core/network/dio_client.dart';
import 'package:dio_with_clean/core/network/network_info.dart';
import 'package:dio_with_clean/core/network/network_info_impl.dart';
import 'package:dio_with_clean/features/todo/data/dataSources/todo_remote_data_source.dart';
import 'package:dio_with_clean/features/todo/data/dataSources/todo_remote_data_source_impl.dart';
import 'package:dio_with_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:dio_with_clean/features/todo/domain/repositories/todo_repository_impl.dart';
import 'package:dio_with_clean/features/todo/domain/usecases/todo_use_cases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  return NetworkInfoImpl(connectivity: connectivity);
});

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiServiceImpl(dio: DioClient.instance);
});

final todoRemoteDataSourceProvider = Provider<TodoRemoteDataSource>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return TodoRemoteDataSourceImpl(apiService: apiService);
});

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final remoteDataSource = ref.watch(todoRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return TodoRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

final todoUseCasesProvider = Provider<TodoUseCases>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return TodoUseCases(repository: repository);
});
