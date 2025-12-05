import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/colors.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/dimens.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/text_styles.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/presentation/cubit/wikifood_cubit.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/presentation/cubit/wikifood_state.dart';
import 'package:nutri_ai_devfest2025/src/core/localization/generated/app_localizations.dart';

class WikifoodPage extends StatefulWidget {
  const WikifoodPage({super.key});

  @override
  State<WikifoodPage> createState() => _WikifoodPageState();
}

class _WikifoodPageState extends State<WikifoodPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary.withOpacity(0.05), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Title
              Text(
                l10n.wikifoodPageTitle,
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fade().slideX(begin: -0.3),

              const SizedBox(height: AppDimensions.small),

              Text(
                AppLocalizations.of(context)!.wikifoodPageDescription,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ).animate().fade(delay: 200.ms).slideX(begin: -0.3),

              const SizedBox(height: AppDimensions.large),

              // Search Bar with Gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.blueGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppDimensions.medium),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blueGradient[0].withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.medium),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.medium - 2,
                      ),
                    ),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: l10n.wikifoodPageSearchHint,
                        hintStyle: AppTextStyles.body.copyWith(
                          color: AppColors.textSecondary.withOpacity(0.7),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.primary,
                        ),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                            ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.small,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                              if (_textController.text.isNotEmpty) {
                                context.read<WikifoodCubit>().search(
                                  _textController.text,
                                );
                              }
                            },
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.medium,
                          vertical: AppDimensions.medium,
                        ),
                      ),
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          context.read<WikifoodCubit>().search(value);
                        }
                      },
                    ),
                  ),
                ),
              ).animate().fade(delay: 400.ms).slideY(begin: 0.3),

              const SizedBox(height: AppDimensions.large),

              // Results Section
              Expanded(
                child: BlocBuilder<WikifoodCubit, WikifoodState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => _buildEmptyState(l10n),
                      loading: () => _buildLoadingState(),
                      loaded: (recommendations) =>
                          _buildResultsList(recommendations, l10n),
                      error: (message) => _buildErrorState(message, l10n),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4facfe).withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(
              Icons.restaurant_menu,
              size: 60,
              color: Colors.white,
            ),
          ).animate().scale(delay: 200.ms),
          const SizedBox(height: AppDimensions.large),
          Text(
            l10n.wikifoodPageInitial,
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ).animate().fade(delay: 400.ms),
          const SizedBox(height: AppDimensions.small),
          Text(
            AppLocalizations.of(context)!.wikifoodPageSearchPlaceholder,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ).animate().fade(delay: 600.ms),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 1200.ms),
          const SizedBox(height: AppDimensions.large),
          Text(
            AppLocalizations.of(context)!.wikifoodPageSearching,
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.textPrimary,
            ),
          ).animate().fade(delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildResultsList(List recommendations, AppLocalizations l10n) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: recommendations.length,
      itemBuilder: (context, index) {
        final item = recommendations[index];
        return Container(
          margin: const EdgeInsets.only(bottom: AppDimensions.medium),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, AppColors.primary.withOpacity(0.02)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.medium),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: AppColors.primary.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push('/wikifood/detail', extra: item),
              borderRadius: BorderRadius.circular(AppDimensions.medium),
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.medium),
                child: Row(
                  children: [
                    // Food Icon with Gradient
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _getGradientColors(index),
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.small,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _getGradientColors(
                              index,
                            )[0].withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.restaurant,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.medium),
                    // Food Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.analysis.foodName,
                            style: AppTextStyles.heading3.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppDimensions.small),
                          Text(
                            item.analysis.description,
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppDimensions.small),
                          // Nutrition Info
                          Row(
                            children: [
                              _buildNutritionChip(
                                '${item.analysis.calories} ${AppLocalizations.of(context)!.wikifoodPageCaloriesUnit}',
                                Icons.local_fire_department,
                                AppColors.orangeGradient[0],
                              ),
                              const SizedBox(width: AppDimensions.small),
                              _buildNutritionChip(
                                '${item.analysis.protein}${AppLocalizations.of(context)!.wikifoodPageProteinUnit}',
                                Icons.fitness_center,
                                AppColors.purpleGradient[0],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Arrow Icon
                    Container(
                      padding: const EdgeInsets.all(AppDimensions.small),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.small,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ).animate().fade(delay: (100 * index).ms).slideX(begin: 0.3);
      },
    );
  }

  Widget _buildNutritionChip(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.small,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: AppTextStyles.body.copyWith(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.error_outline, size: 50, color: AppColors.error),
          ),
          const SizedBox(height: AppDimensions.large),
          Text(
            AppLocalizations.of(context)!.wikifoodPageErrorMessage,
            style: AppTextStyles.heading3.copyWith(color: AppColors.error),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.small),
          Text(
            message,
            style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<Color> _getGradientColors(int index) {
    final gradients = [
      AppColors.purpleGradient, // Purple
      AppColors.pinkGradient, // Pink
      AppColors.blueGradient, // Blue
      AppColors.greenGradient, // Green
      AppColors.orangeGradient, // Orange
    ];
    return gradients[index % gradients.length];
  }
}
