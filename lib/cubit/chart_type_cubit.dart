import 'package:flutter_bloc/flutter_bloc.dart';

class ChartTypeCubit extends Cubit<bool> {
  ChartTypeCubit() : super(false); // false = Bar Chart, true = Line Chart

  void toggleChartType() => emit(!state);
}
