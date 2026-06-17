import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/utils/link_helper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Text(
                'Let\'s Build Something Together',
                textAlign: TextAlign.center,
                style: AppTextStyles.splashHeading(context, fontSize: 32),
              ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),

              SizedBox(height: AppSpacing.h24),

              Text(
                    'Open to Full Stack Developer roles, freelance projects, collaborations, and exciting opportunities. Feel free to reach out directly!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle(
                      context,
                      color: isDark
                          ? AppColors.darkSecondaryText
                          : AppColors.lightSecondaryText,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 500.ms)
                  .slideY(begin: 0.1, end: 0),

              SizedBox(height: AppSpacing.h64),

              Wrap(
                spacing: AppSpacing.w24,
                runSpacing: AppSpacing.h24,
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: _ContactMethodCard(
                      icon: LucideIcons.mail,
                      title: 'Email',
                      value: 'haribaskark303@gmail.com',
                      iconColor: const Color(0xFFEA4335), // Google/Gmail Red
                      onTap: () =>
                          LinkHelper.sendEmail('haribaskark303@gmail.com'),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: _ContactMethodCard(
                      icon: LucideIcons.linkedin,
                      title: 'LinkedIn',
                      value: 'Hari Baskar', // Subtitle text instead of link
                      iconColor: const Color(0xFF0077B5), // LinkedIn Blue
                      onTap: () => LinkHelper.launchURL(
                        'https://www.linkedin.com/in/hari-baskar%E2%86%97%EF%B8%8F/',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: _ContactMethodCard(
                      icon: LucideIcons.github,
                      title: 'GitHub',
                      value: 'Hari Baskar', // Subtitle text instead of link
                      iconColor: const Color(0xFF181717), // GitHub Black
                      onTap: () => LinkHelper.launchURL(
                        'https://github.com/Hari-Baskar',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: _ContactMethodCard(
                      icon: LucideIcons.fileText,
                      title: 'Resume',
                      value: 'Download Portfolio Resume',
                      iconColor: AppColors.primaryAccent, // Keep brand color for resume
                      onTap: () {
                        LinkHelper.launchURL('assets/resume.pdf');
                      }, // Action to download resume
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 200.ms, duration: 500.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactMethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;
  final Color iconColor;

  const _ContactMethodCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          boxShadow: isDark
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white, // Pure white background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: iconColor, size: 24), // Use brand color
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.small(
                      context,
                      color: isDark
                          ? AppColors.darkSecondaryText
                          : AppColors.lightSecondaryText,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    value,
                    style: AppTextStyles.body(
                      context,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
