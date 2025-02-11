import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/motel_repository.dart';
import 'motel_state.dart';

class MotelCubit extends Cubit<MotelState> {
  final MotelRepository motelRepository;

  MotelCubit(this.motelRepository) : super(MotelInitial());

  Future<void> fetchMoteis() async {
    emit(MotelLoading());

    try {
      final moteis = await motelRepository.fetchMoteis();
      emit(MotelLoaded(moteis: moteis));
    } catch (e) {
      emit(MotelError(message: 'Erro ao carregar os motéis: $e'));
    }
  }
}
