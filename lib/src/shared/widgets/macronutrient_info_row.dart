import 'package:flutter/material.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/dimens.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/text_styles.dart';

class MacronutrientInfoRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;

  const MacronutrientInfoRow({
    super.key,
    required this.title,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.small),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.medium,
        vertical: AppDimensions.small,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppDimensions.small),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.white, size: 20),
                const SizedBox(width: AppDimensions.small),
              ],
              Text(
                title,
                style: AppTextStyles.body.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: AppTextStyles.body.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
