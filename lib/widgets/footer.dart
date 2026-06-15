import 'package:flutter/material.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/styles/app_size.dart';
import 'package:praveen_website/core/utils/link_helper.dart';

class Footer extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProductsPressed;
  final VoidCallback onContactPressed;
  final VoidCallback onPrivacyPressed;
  final VoidCallback onTermsPressed;
  final VoidCallback onSupportPressed;

  const Footer({
    super.key,
    required this.onHomePressed,
    required this.onExperiencePressed,
    required this.onProductsPressed,
    required this.onContactPressed,
    required this.onPrivacyPressed,
    required this.onTermsPressed,
    required this.onSupportPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.h64, horizontal: AppSpacing.w24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondaryBackgroundColor : AppColors.lightSecondaryBackgroundColor,
        border: Border(top: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                style: AppTextStyles.heading(context, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.h12),
          Text(
            'Full Stack Developer & Product Builder',
            style: AppTextStyles.body(context, color: AppColors.darkSecondaryText),
          ),
          SizedBox(height: AppSpacing.h32),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _FooterLink(context, 'Home', onHomePressed),
              _FooterLink(context, 'Experience', onExperiencePressed),
              _FooterLink(context, 'Products', onProductsPressed),
              _FooterLink(context, 'Contact', onContactPressed),
              _FooterLink(context, 'Privacy Policy', onPrivacyPressed),
              _FooterLink(context, 'Terms & Conditions', onTermsPressed),
              _FooterLink(context, 'Support', onSupportPressed),
              _FooterLink(context, 'App-Ads.txt', () => LinkHelper.launchURL('https://praveen-apps.web.app/app-ads.txt')),
            ],
          ),
          SizedBox(height: AppSpacing.h32),
          Text(
            '© ${DateTime.now().year} Hari Baskar K. All rights reserved.',
            style: AppTextStyles.small(context, color: AppColors.darkSecondaryText),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _FooterLink(this.context, this.title, this.onTap);
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: AppTextStyles.body(context, fontWeight: FontWeight.w600, color: AppColors.darkSecondaryText),
      ),
    );
  }
}
