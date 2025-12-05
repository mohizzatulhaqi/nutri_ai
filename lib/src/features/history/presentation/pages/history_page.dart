import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/text_styles.dart';
import 'package:nutri_ai_devfest2025/src/features/history/presentation/cubit/history_cubit.dart';
import 'package:nutri_ai_devfest2025/src/features/history/presentation/cubit/history_state.dart';
import 'package:nutri_ai_devfest2025/src/shared/widgets/custom_card.dart';
import 'package:nutri_ai_devfest2025/src/core/localization/generated/app_localizations.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (history) {
              if (history.isEmpty) {
                return Center(
                  child: Text(
                    l10n.historyPageNoHistory,
                    style: AppTextStyles.body,
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final item = history[index];
                  return CustomCard(
                    onTap: () =>
                        context.push('/analysis', extra: item.analysis),
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 6,
                    ),
                    child: ListTile(
                      title: Text(
                        item.analysis.foodName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(item.date.toString()),
                    ),
                  ).animate().fade(delay: (100 * index).ms).slideY(begin: 0.2);
                },
              );
            },
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
