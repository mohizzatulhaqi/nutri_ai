import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/dimens.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/text_styles.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/domain/entities/food_recommendation_entity.dart';
import 'package:nutri_ai_devfest2025/src/shared/widgets/gradient_section_card.dart';
import 'package:nutri_ai_devfest2025/src/shared/widgets/macronutrient_info_row.dart';
import 'package:nutri_ai_devfest2025/src/core/localization/generated/app_localizations.dart';

class WikifoodDetailPage extends StatelessWidget {
  final FoodRecommendationEntity recommendation;

  const WikifoodDetailPage({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final analysis = recommendation.analysis;
    return Scaffold(
      appBar: AppBar(
        title: Text(analysis.foodName),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food name and description
            Text(
              analysis.foodName,
              style: AppTextStyles.heading1.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ).animate().fade().slideY(begin: -0.2, duration: 300.ms),
            const SizedBox(height: AppDimensions.small),
            Text(
              analysis.description,
              style: AppTextStyles.body.copyWith(
                color: Colors.black54,
                height: 1.5,
              ),
            ).animate().fade(delay: 100.ms).slideY(begin: 0.2),
            const SizedBox(height: AppDimensions.large),

            // Recommendation reason section (main focus)
            if (recommendation.analysis.recommendationReason?.isNotEmpty ??
                false)
              GradientSectionCard(
                title: l10n.analysisPageReason,
                icon: Icons.lightbulb_outline,
                gradientColors: GradientSectionCard.reasonGradient,
                textColor: Colors.white,
                animationDelay: 200,
                child: Container(
                  padding: const EdgeInsets.all(AppDimensions.small),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppDimensions.small),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: AppDimensions.small),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: recommendation
                              .analysis
                              .recommendationReason!
                              .map(
                                (reason) => Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: AppDimensions.small,
                                  ),
                                  child: Text(
                                    '• $reason',
                                    style: AppTextStyles.body.copyWith(
                                      color: Colors.white,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: AppDimensions.large),

            // Macronutrients section (second focus)
            GradientSectionCard(
              title: l10n.analysisPageMacronutrients,
              icon: Icons.bar_chart,
              gradientColors: GradientSectionCard.macronutrientsGradient,
              textColor: Colors.white,
              animationDelay: 400,
              child: Column(
                children: [
                  MacronutrientInfoRow(
                    title: l10n.analysisPageCalories,
                    value: '${analysis.calories} kcal',
                    icon: Icons.local_fire_department,
                  ),
                  MacronutrientInfoRow(
                    title: l10n.analysisPageProtein,
                    value: '${analysis.protein} g',
                    icon: Icons.fitness_center,
                  ),
                  MacronutrientInfoRow(
                    title: l10n.analysisPageFat,
                    value: '${analysis.fat} g',
                    icon: Icons.opacity,
                  ),
                  MacronutrientInfoRow(
                    title: l10n.analysisPageCarbohydrates,
                    value: '${analysis.carbohydrates} g',
                    icon: Icons.grain,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppDimensions.large),

            // Vitamins section (if exists)
            if (analysis.micronutrients.isNotEmpty)
              GradientSectionCard(
                title: l10n.analysisPageVitamins,
                icon: Icons.local_pharmacy,
                gradientColors: GradientSectionCard.vitaminsGradient,
                textColor: Colors.white,
                animationDelay: 600,
                child: Wrap(
                  spacing: AppDimensions.small,
                  runSpacing: AppDimensions.small,
                  children: analysis.micronutrients
                      .map(
                        (micronutrient) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.medium,
                            vertical: AppDimensions.small,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            micronutrient,
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

            const SizedBox(height: AppDimensions.large),

            // Ingredients section (if exists)
            if (analysis.ingredients.isNotEmpty)
              GradientSectionCard(
                title: l10n.analysisPageIngredients,
                icon: Icons.restaurant_menu,
                gradientColors: GradientSectionCard.ingredientsGradient,
                textColor: Colors.white,
                animationDelay: 800,
                child: Wrap(
                  spacing: AppDimensions.small,
                  runSpacing: AppDimensions.small,
                  children: analysis.ingredients
                      .map(
                        (ingredient) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.medium,
                            vertical: AppDimensions.small,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            ingredient,
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
