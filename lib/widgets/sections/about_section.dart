import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.h64 * 1.5,
        horizontal: AppSpacing.w24,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkBackground
            : AppColors.lightSecondaryBackgroundColor,
      ),
      child: Column(
        children: [
          Text(
            'About Me',
            style: AppTextStyles.splashHeading(context, fontSize: 32),
          ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),

          SizedBox(height: AppSpacing.h48),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                Text(
                  'I am a Full Stack Developer focused on building products from idea to launch.',
                  style: AppTextStyles.body(
                    context,
                    fontSize: 20, // slightly larger to compensate for lack of card
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 200.ms, duration: 500.ms),
                SizedBox(height: AppSpacing.h24),
                Text(
                  'I have experience developing production mobile applications, integrating Firebase services, implementing scalable architectures, and shipping software used by real users.',
                  style: AppTextStyles.body(
                    context,
                    fontSize: 20,
                    color: isDark
                        ? AppColors.darkSecondaryText
                        : AppColors.lightSecondaryText,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 300.ms, duration: 500.ms),
                SizedBox(height: AppSpacing.h24),
                Text(
                  'Currently building Finzo and exploring product development through GENZ System.',
                  style: AppTextStyles.body(
                    context,
                    fontSize: 20,
                    color: isDark
                        ? AppColors.darkSecondaryText
                        : AppColors.lightSecondaryText,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
