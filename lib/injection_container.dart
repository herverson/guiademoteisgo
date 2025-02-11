import 'package:get_it/get_it.dart';
import 'package:guiademoteisgo/presentation/bloc/tab_cubit.dart';
import 'package:http/http.dart' as http;
import 'data/datasources/motel_remote_data_source.dart';
import 'data/datasources/motel_remote_data_source_impl.dart';
import 'data/repositories_impl/motel_repository_impl.dart';
import 'domain/repositories/motel_repository.dart';
import 'domain/usecases/get_moteis.dart';
import 'presentation/bloc/motel_cubit.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(() => MotelCubit(sl()));
  sl.registerFactory(() => TabStateCubit());

  // Use cases
  sl.registerLazySingleton(() => GetMoteis(sl()));

  // Repository
  sl.registerLazySingleton<MotelRepository>(() => MotelRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<MotelRemoteDataSource>(
      () => MotelRemoteDataSourceImpl());

  // External
  sl.registerLazySingleton(() => http.Client());
}
