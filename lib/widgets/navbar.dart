import 'package:flutter/material.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/styles/app_size.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProductsPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onContactPressed;

  const Navbar({
    super.key,
    required this.onHomePressed,
    required this.onExperiencePressed,
    required this.onProductsPressed,
    required this.onSkillsPressed,
    required this.onAboutPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: AppSize.iconExtraLarge,
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.w12,
        vertical: AppSpacing.h12,
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.w16),
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBackground : AppColors.white)
            .withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppSize.buttonRadius + 4),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onHomePressed,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSpacing.w8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'HB',
                    style: AppTextStyles.heading(
                      context,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryAccent,
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.w12),
                Text(
                  'Hari Baskar K',
                  style: AppTextStyles.heading(
                    context,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (MediaQuery.of(context).size.width > 900) // Increased breakpoint for more items
            Row(
              children: [
                _NavLink(context, 'Home', onHomePressed),
                _NavLink(context, 'Experience', onExperiencePressed),
                _NavLink(context, 'Products', onProductsPressed),
                _NavLink(context, 'Skills', onSkillsPressed),
                _NavLink(context, 'About', onAboutPressed),
                _NavLink(context, 'Contact', onContactPressed),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu), 
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }

  Widget _NavLink(BuildContext context, String title, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(foregroundColor: AppColors.darkSecondaryText),
      child: Text(
        title,
        style: AppTextStyles.body(context, fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}
