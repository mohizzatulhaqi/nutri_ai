import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/presentation/cubit/analysis_cubit.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/presentation/pages/analysis_page.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/presentation/pages/analysis_detail_page.dart';
import 'package:nutri_ai_devfest2025/src/features/app/presentation/pages/home_page.dart';
import 'package:nutri_ai_devfest2025/src/features/history/presentation/cubit/history_cubit.dart';
import 'package:nutri_ai_devfest2025/src/features/history/presentation/pages/history_page.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/domain/entities/food_recommendation_entity.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/presentation/cubit/wikifood_cubit.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/presentation/pages/wikifood_detail_page.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/presentation/pages/wikifood_page.dart';
import 'package:nutri_ai_devfest2025/src/injection.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<AnalysisCubit>(),
            child: const AnalysisPage(),
          ),
        ),
        GoRoute(
          path: '/wikifood',
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<WikifoodCubit>(),
            child: const WikifoodPage(),
          ),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<HistoryCubit>()..getHistory(),
            child: const HistoryPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/wikifood/detail',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final recommendation = state.extra as FoodRecommendationEntity;
        return WikifoodDetailPage(recommendation: recommendation);
      },
    ),
    GoRoute(
      path: '/analysis/detail',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final analysis = extra['analysis'] as FoodAnalysis;
        final imageFile = extra['imageFile'] as File?;
        return AnalysisDetailPage(analysis: analysis, imageFile: imageFile);
      },
    ),
    GoRoute(
      path: '/history/detail',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final analysis = state.extra as FoodAnalysis;
        return AnalysisDetailPage(analysis: analysis);
      },
    ),
  ],
);
