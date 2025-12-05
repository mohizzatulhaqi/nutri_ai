import 'package:flutter/material.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/dimens.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: margin ?? const EdgeInsets.only(bottom: AppDimensions.medium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.small),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.small),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppDimensions.medium),
          child: child,
        ),
      ),
    );
  }
}
