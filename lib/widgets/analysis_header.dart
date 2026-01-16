import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';
import 'package:sipnudge_machine_task/core/utile/date_formatter.dart';
import 'package:sipnudge_machine_task/cubit/analysis_cubic/cubit/analysis_cubit.dart';
import 'package:sipnudge_machine_task/cubit/analysis_cubic/cubit/analysis_state.dart';
import 'analysis_tab_item.dart';

class AnalysisHeader extends StatelessWidget {
  const AnalysisHeader({super.key});

  final List<String> _tabs = const ["Weekly", "Monthly", "Yearly"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      builder: (context, state) {
        final cubit = context.read<AnalysisCubit>();

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.analysisBg,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: _tabs.map((tab) {
                    return AnalysisTabItem(
                      label: tab,
                      isSelected: state.selectedInterval == tab,
                      onTap: () => cubit.updateInterval(tab),
                    );
                  }).toList(),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: () => cubit.previous(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.arrowColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        DateFormatter.formatDateLabel(
                          state.currentDate,
                          state.selectedInterval,
                        ),
                        style: AppTypography.dateRangeHeader,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () => cubit.next(),
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.arrowColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
