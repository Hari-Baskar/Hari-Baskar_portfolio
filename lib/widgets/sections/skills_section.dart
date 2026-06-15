import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/widgets/common/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.h64 * 1.5,
        horizontal: AppSpacing.w24,
      ),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          Text(
            'What I do',
            style: AppTextStyles.heading(
              context,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),

          SizedBox(height: AppSpacing.h16),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child:
                Text(
                      'I am a passionate Full Stack Developer and Product Builder, currently focused on creating beautiful, responsive, and high-performance applications. I have experience building end-to-end applications and architecting scalable backend solutions.',
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
          ),

          SizedBox(height: AppSpacing.h64),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Wrap(
              spacing: AppSpacing.w24,
              runSpacing: AppSpacing.h24,
              alignment: WrapAlignment.center,
              children: [
                SkillCard(
                  title: 'Flutter',
                  icon: SimpleIcons.flutter,
                  iconColor: const Color(0xFF02569B),
                  delay: 200,
                ),
                SkillCard(
                  title: 'Dart',
                  icon: SimpleIcons.dart,
                  iconColor: const Color(0xFF0175C2),
                  delay: 250,
                ),
                SkillCard(
                  title: 'Firebase',
                  icon: SimpleIcons.firebase,
                  iconColor: const Color(0xFFFFCA28),
                  delay: 300,
                ),
                SkillCard(
                  title: 'FastAPI',
                  icon: SimpleIcons.fastapi,
                  iconColor: const Color(0xFF009688),
                  delay: 350,
                ),
                SkillCard(
                  title: 'Postgres',
                  icon: SimpleIcons.postgresql,
                  iconColor: const Color(0xFF336791),
                  delay: 400,
                ),
                SkillCard(
                  title: 'AWS',
                  icon: LucideIcons.cloud,
                  iconColor: const Color(0xFFFF9900),
                  delay: 450,
                ),
                SkillCard(
                  title: 'Git',
                  icon: SimpleIcons.git,
                  iconColor: const Color(0xFFF05032),
                  delay: 500,
                ),
                SkillCard(
                  title: 'GitHub',
                  icon: SimpleIcons.github,
                  iconColor: isDark ? Colors.white : Colors.black,
                  delay: 550,
                ),
                SkillCard(
                  title: 'Figma',
                  icon: SimpleIcons.figma,
                  iconColor: const Color(0xFFF24E1E),
                  delay: 600,
                ),
                SkillCard(
                  title: 'REST APIs',
                  icon: LucideIcons.network,
                  iconColor: AppColors.primaryAccent,
                  delay: 650,
                ),
                SkillCard(
                  title: 'VS Code',
                  icon: LucideIcons.code,
                  iconColor: const Color(0xFF007ACC),
                  delay: 700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
