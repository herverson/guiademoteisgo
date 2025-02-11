import '../repositories/motel_repository.dart';
import '../../core/usecases/usecase.dart';
import '../entities/motel.dart';

class GetMoteis implements UseCase<List<Motel>, NoParams> {
  final MotelRepository repository;

  GetMoteis(this.repository);

  @override
  Future<List<Motel>> call(NoParams params) async {
    return await repository.fetchMoteis();
  }
}
