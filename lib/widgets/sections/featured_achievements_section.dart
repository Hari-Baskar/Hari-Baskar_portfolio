import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/widgets/common/hover_scale_card.dart';

class CoreExpertiseSection extends StatelessWidget {
  const CoreExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final expertiseList = [
      {
        'order': 1,
        'title': 'Architecture',
        'subtitle': 'Riverpod • Feature First Architecture',
        'icon': SimpleIcons.dart,
      },
      {
        'order': 2,
        'title': 'Backend Integration',
        'subtitle': 'REST APIs • Firebase • FastAPI',
        'icon': SimpleIcons.firebase,
      },
      {
        'order': 3,
        'title': 'Real-Time Systems',
        'subtitle': 'Sockets • Chat Systems',
        'icon': SimpleIcons.socketdotio,
      },
      {
        'order': 4,
        'title': 'Product Development',
        'subtitle': 'Flutter Mobile • Flutter Web',
        'icon': SimpleIcons.flutter,
      },
      {
        'order': 5,
        'title': 'Monitoring',
        'subtitle': 'Crashlytics • Analytics • Performance',
        'icon': SimpleIcons.googleanalytics,
      },
      {
        'order': 6,
        'title': 'AI Integrations',
        'subtitle': 'Gemini API • OpenAI API',
        'icon': SimpleIcons.googlegemini,
      },
      {
        'order': 7,
        'title': 'Deep Linking',
        'subtitle': 'Deferred Deep Linking (Android & iOS)',
        'icon': SimpleIcons.android,
      },
      {
        'order': 8,
        'title': 'Databases',
        'subtitle': 'PostgreSQL • Firebase • MongoDB',
        'icon': SimpleIcons.postgresql,
      },
      {
        'order': 9,
        'title': 'Payment Gateways',
        'subtitle': 'Razorpay Integration',
        'icon': SimpleIcons.razorpay,
      },
    ];

    // Sort by order so it's easy to re-arrange
    expertiseList.sort(
      (a, b) => (a['order'] as int).compareTo(b['order'] as int),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.h64,
        horizontal: AppSpacing.w24,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSecondaryBackgroundColor
            : AppColors.lightSecondaryBackgroundColor,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Core Expertise',
                style: AppTextStyles.heading(
                  context,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),

              SizedBox(height: AppSpacing.h16),

              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primaryAccent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ).animate().fadeIn(delay: 200.ms).scaleX(),

              SizedBox(height: AppSpacing.h48),

              Wrap(
                spacing: AppSpacing.w24,
                runSpacing: AppSpacing.h24,
                alignment: WrapAlignment.center,
                children: expertiseList
                    .map(
                      (expertise) => _ExpertiseCard(
                        title: expertise['title'] as String,
                        subtitle: expertise['subtitle'] as String,
                        icon: expertise['icon'] as IconData,
                      ),
                    )
                    .toList(),
              ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExpertiseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _ExpertiseCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return HoverScaleCard(
      child: Container(
        width: 380,
        height: 240, // Increased height for better spacing
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.w32,
          vertical: AppSpacing.h32,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          boxShadow: isDark
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: AppColors.primaryAccent, size: 36),
            ),
            SizedBox(height: AppSpacing.h24),
            Text(
              title,
              style: AppTextStyles.body(
                context,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: isDark ? AppColors.darkText : AppColors.lightText,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: AppSpacing.h12),
            Expanded(
              child: Text(
                subtitle,
                style: AppTextStyles.body(
                  context,
                  fontSize: 16,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.lightSecondaryText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
