import '../../domain/repositories/motel_repository.dart';
import '../../domain/entities/motel.dart';
import '../datasources/motel_remote_data_source.dart';

class MotelRepositoryImpl implements MotelRepository {
  final MotelRemoteDataSource remoteDataSource;

  MotelRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Motel>> fetchMoteis() async {
    return await remoteDataSource.fetchMoteis();
  }
}
