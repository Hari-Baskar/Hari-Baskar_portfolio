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
        'order': 6,
        'title': 'Architecture',
        'subtitle': 'Riverpod • Feature First Architecture',
        'icon': SimpleIcons.dart,
        'iconColor': const Color(0xFF0175C2), // Dart Blue
      },
      {
        'order': 5,
        'title': 'Backend Integration',
        'subtitle': 'REST APIs • Firebase • FastAPI',
        'icon': SimpleIcons.firebase,
        'iconColor': const Color(0xFFFFCA28), // Firebase Yellow
      },
      {
        'order': 4,
        'title': 'Real-Time Systems',
        'subtitle': 'Sockets • Chat Systems',
        'icon': SimpleIcons.socketdotio,
        'iconColor': const Color(0xFF010101), // Socket.io Black
      },
      {
        'order': 1,
        'title': 'Product Development',
        'subtitle': 'Flutter Mobile • Flutter Web',
        'icon': SimpleIcons.flutter,
        'iconColor': const Color(0xFF02569B), // Flutter Blue
      },
      {
        'order': 5,
        'title': 'Monitoring',
        'subtitle': 'Crashlytics • Analytics • Performance',
        'icon': SimpleIcons.googleanalytics,
        'iconColor': const Color(0xFFE37400), // Analytics Orange
      },
      {
        'order': 2,
        'title': 'AI Integrations',
        'subtitle': 'Gemini API • OpenAI API',
        'icon': SimpleIcons.googlegemini,
        'iconColor': const Color(0xFF8E75B2), // Gemini Purple
      },
      {
        'order': 7,
        'title': 'Deep Linking',
        'subtitle': 'Deferred Deep Linking (Android & iOS)',
        'icon': SimpleIcons.android,
        'iconColor': const Color(0xFF3DDC84), // Android Green
      },
      {
        'order': 8,
        'title': 'Databases',
        'subtitle': 'PostgreSQL • Firebase • MongoDB',
        'icon': SimpleIcons.postgresql,
        'iconColor': const Color(0xFF336791), // Postgres Blue
      },
      {
        'order': 3,
        'title': 'Payment Gateways',
        'subtitle': 'Razorpay Integration',
        'icon': SimpleIcons.razorpay,
        'iconColor': const Color(0xFF02042B), // Razorpay Blue
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
                style: AppTextStyles.splashHeading(context, fontSize: 32),
              ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),

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
                        iconColor: expertise['iconColor'] as Color,
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
  final Color iconColor;

  const _ExpertiseCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
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
                color: Colors
                    .white, // Pure white background for the icon as requested
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: iconColor, size: 36), // Use brand color
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
