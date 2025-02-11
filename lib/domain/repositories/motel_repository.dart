import '../entities/motel.dart';

abstract class MotelRepository {
  Future<List<Motel>> fetchMoteis();
}
