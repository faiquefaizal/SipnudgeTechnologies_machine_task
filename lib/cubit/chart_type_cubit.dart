import 'package:flutter_bloc/flutter_bloc.dart';

class ChartTypeCubit extends Cubit<bool> {
  ChartTypeCubit() : super(false);

  void toggleChartType() => emit(!state);
}
