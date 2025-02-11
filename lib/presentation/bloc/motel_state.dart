import 'package:equatable/equatable.dart';
import 'package:guiademoteisgo/domain/entities/motel.dart';

abstract class MotelState extends Equatable {
  const MotelState();

  @override
  List<Object?> get props => [];
}

class MotelInitial extends MotelState {}

class MotelLoading extends MotelState {}

class MotelLoaded extends MotelState {
  final List<Motel> moteis;

  const MotelLoaded({required this.moteis});

  @override
  List<Object?> get props => [moteis];
}

class MotelError extends MotelState {
  final String message;

  const MotelError({required this.message});

  @override
  List<Object?> get props => [message];
}
