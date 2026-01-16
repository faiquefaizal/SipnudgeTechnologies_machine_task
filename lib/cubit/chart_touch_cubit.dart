import 'package:flutter_bloc/flutter_bloc.dart';

class ChartTouchCubit extends Cubit<int> {
  ChartTouchCubit() : super(-1);

  void setTouchedIndex(int index) {
    emit(index);
  }
}
