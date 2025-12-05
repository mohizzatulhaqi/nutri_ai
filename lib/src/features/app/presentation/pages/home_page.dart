import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_ai_devfest2025/src/core/localization/language_provider.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/colors.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/text_styles.dart';
import 'package:nutri_ai_devfest2025/src/core/localization/generated/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NutriAI',
          style: AppTextStyles.heading2.copyWith(color: AppColors.surface),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          PopupMenuButton<Locale>(
            onSelected: (Locale locale) {
              Provider.of<LanguageProvider>(
                context,
                listen: false,
              ).setLocale(locale);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
              const PopupMenuItem<Locale>(
                value: Locale('en'),
                child: Text('English'),
              ),
              const PopupMenuItem<Locale>(
                value: Locale('id'),
                child: Text('Bahasa Indonesia'),
              ),
            ],
            icon: const Icon(Icons.language, color: AppColors.surface),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.analytics),
            label: l10n.homePageAnalyzer,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.food_bank),
            label: l10n.homePageWikifood,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: l10n.homePageHistory,
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) => _onItemTapped(index, context),
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        selectedLabelStyle: AppTextStyles.body,
        unselectedLabelStyle: AppTextStyles.body,
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/wikifood')) {
      return 1;
    }
    if (location.startsWith('/history')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/wikifood');
        break;
      case 2:
        context.go('/history');
        break;
    }
  }
}
