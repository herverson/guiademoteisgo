import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/usecases/usecase.dart';
import '../../domain/usecases/get_moteis.dart';
import 'motel_state.dart';

class MotelCubit extends Cubit<MotelState> {
  final GetMoteis getMoteis;

  MotelCubit(this.getMoteis) : super(MotelInitial());

  Future<void> fetchMoteis() async {
    emit(MotelLoading());

    try {
      final moteis = await getMoteis(NoParams());
      emit(MotelLoaded(moteis: moteis));
    } catch (e) {
      emit(MotelError(message: 'Erro ao carregar os motéis: $e'));
    }
  }
}
