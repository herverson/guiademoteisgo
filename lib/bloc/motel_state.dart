import '../models/models.dart';

abstract class MotelState {}

class MotelInitial extends MotelState {}

class MotelLoading extends MotelState {}

class MotelLoaded extends MotelState {
  final List<Motel> moteis;

  MotelLoaded({required this.moteis});
}

class MotelError extends MotelState {
  final String message;

  MotelError({required this.message});
}
