import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/dimens.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/text_styles.dart';

class GradientSectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Color> gradientColors;
  final Color textColor;
  final int animationDelay;
  final IconData? icon;

  const GradientSectionCard({
    super.key,
    required this.title,
    required this.child,
    required this.gradientColors,
    required this.textColor,
    this.animationDelay = 0,
    this.icon,
  });

  // Predefined gradient themes
  static const List<Color> reasonGradient = [
    Color(0xFF667eea),
    Color(0xFF764ba2),
  ];

  static const List<Color> macronutrientsGradient = [
    Color(0xFFf093fb),
    Color(0xFFf5576c),
  ];

  static const List<Color> vitaminsGradient = [
    Color(0xFF4facfe),
    Color(0xFF00f2fe),
  ];

  static const List<Color> ingredientsGradient = [
    Color(0xFF43e97b),
    Color(0xFF38f9d7),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimensions.small),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.medium),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.large),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.medium),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: textColor, size: 24),
                  const SizedBox(width: AppDimensions.small),
                ],
                Text(
                  title,
                  style: AppTextStyles.heading2.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.medium),
            child,
          ],
        ),
      ),
    ).animate().fade(delay: animationDelay.ms).slideY(begin: 0.3);
  }
}
