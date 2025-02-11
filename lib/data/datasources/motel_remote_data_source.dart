import '../../domain/entities/motel.dart';

abstract class MotelRemoteDataSource {
  Future<List<Motel>> fetchMoteis();
}
