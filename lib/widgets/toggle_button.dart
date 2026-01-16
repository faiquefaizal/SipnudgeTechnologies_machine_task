import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/cubit/chart_type_cubit.dart';

class ToggleButton extends StatelessWidget {
  final BuildContext context;
  const ToggleButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    final isLineChart = context.read<ChartTypeCubit>().state;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (isLineChart) {
              context.read<ChartTypeCubit>().toggleChartType();
            }
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: !isLineChart
                  ? AppColors
                        .activePurple // Icon active purple
                  : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Icon(
              Icons.bar_chart,
              color: !isLineChart ? Colors.white : Colors.grey,
              size: 20,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (!isLineChart) {
              context.read<ChartTypeCubit>().toggleChartType();
            }
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isLineChart ? AppColors.activePurple : Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Icon(
              Icons.show_chart,
              color: isLineChart ? Colors.white : Colors.grey,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
