import 'package:flutter_bloc/flutter_bloc.dart';

class TabStateCubit extends Cubit<bool> {
  TabStateCubit() : super(true);

  void toggleTab(int index) {
    if (index == 0) {
      emit(true);
    } else {
      emit(false);
    }
  }
}
