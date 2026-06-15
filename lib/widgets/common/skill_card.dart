import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';

class SkillCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final int delay;
  final double size;
  final double iconSize;

  const SkillCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.delay,
    this.size = 140,
    this.iconSize = 48,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize, color: iconColor),
          SizedBox(height: AppSpacing.h16),
          Text(
            title.toUpperCase(),
            style: AppTextStyles.small(context, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms, duration: 500.ms).scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1));
  }
}
