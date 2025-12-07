import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/colors.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/dimens.dart';
import 'package:nutri_ai_devfest2025/src/core/ui/text_styles.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/presentation/cubit/analysis_cubit.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/presentation/cubit/analysis_state.dart';
import 'package:nutri_ai_devfest2025/src/shared/widgets/custom_button.dart';
import 'package:nutri_ai_devfest2025/src/core/localization/generated/app_localizations.dart';

class AnalysisPage extends StatefulWidget {
  final FoodAnalysis? analysis;

  const AnalysisPage({super.key, this.analysis});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocConsumer<AnalysisCubit, AnalysisState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) => _showErrorDialog(context, message),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => _buildInitial(context, l10n),
            loading: () => _buildLoading(l10n),
            loaded: (food) {
              // Navigate to detail page when analysis is complete
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.push(
                  '/analysis/detail',
                  extra: {'analysis': food, 'imageFile': _selectedImage},
                );
                // Reset the cubit state after navigation
                context.read<AnalysisCubit>().reset();
                setState(() {
                  _selectedImage = null;
                });
              });
              // Show loading while navigating
              return _buildLoading(l10n);
            },
            error: (message) => _buildError(message, l10n),
          );
        },
      ),
    );
  }

  Widget _buildInitial(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primaryLight, AppColors.primary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary,
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.restaurant,
                    size: 60,
                    color: AppColors.surface,
                  ),
                )
                .animate()
                .fade(duration: 500.ms)
                .scale(delay: 200.ms, duration: 300.ms),
            const SizedBox(height: AppDimensions.xlarge),
            Text(
                  l10n.analysisPageTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                )
                .animate()
                .fade(delay: 300.ms, duration: 500.ms)
                .slideY(begin: 0.5),
            const SizedBox(height: AppDimensions.medium),
            Text(
                  l10n.analysisPageDescription,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                  ),
                )
                .animate()
                .fade(delay: 500.ms, duration: 500.ms)
                .slideY(begin: 0.5),
            const SizedBox(height: AppDimensions.xxlarge),
            ElevatedButton.icon(
                  onPressed: () => _pickImage(context, ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: Text(l10n.analysisPageTakePhoto),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary),
                  ),
                )
                .animate()
                .fade(delay: 700.ms, duration: 500.ms)
                .slideX(begin: -0.5),
            const SizedBox(height: AppDimensions.medium),
            ElevatedButton.icon(
                  onPressed: () => _pickImage(context, ImageSource.gallery),
                  icon: const Icon(Icons.photo_library),
                  label: Text(l10n.analysisPageChooseFromGallery),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary),
                  ),
                )
                .animate()
                .fade(delay: 900.ms, duration: 500.ms)
                .slideX(begin: 0.5),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedImage != null) ...[
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.medium),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withAlpha(76),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.medium),
                  child: Image.file(_selectedImage!, fit: BoxFit.cover),
                ),
              ).animate().fade(),
              const SizedBox(height: AppDimensions.xlarge),
            ],
            Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(25),
                    shape: BoxShape.circle,
                  ),
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 1200.ms),
            const SizedBox(height: AppDimensions.large),
            Text(
              l10n.analysisPageAnalyzing,
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.textPrimary,
              ),
            ).animate().fade(delay: 200.ms, duration: 500.ms),
            const SizedBox(height: AppDimensions.small),
            Text(
              l10n.analysisPageAnalyzingDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                color: AppTextStyles.body.color,
              ),
            ).animate().fade(delay: 400.ms, duration: 500.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildError(String message, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 80),
            const SizedBox(height: AppDimensions.large),
            Text(
              l10n.errorDialogTitle,
              style: AppTextStyles.heading2.copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.medium),
            Text(
              message,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.xlarge),
            CustomButton(
              text: l10n.errorDialogTryAgain,
              onPressed: () {
                context.read<AnalysisCubit>().reset();
                setState(() {
                  _selectedImage = null;
                });
              },
              icon: Icons.refresh,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      final Uint8List imageBytes = await pickedFile.readAsBytes();
      if (!context.mounted) return;

      final locale = Localizations.localeOf(context);
      final languageCode = locale.languageCode;

      context.read<AnalysisCubit>().analyzeImage(imageBytes, languageCode);
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.errorDialogTitle),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.errorDialogTryAgain),
            ),
          ],
        );
      },
    );
  }
}
