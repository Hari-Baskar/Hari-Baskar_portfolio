import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/widgets/navbar.dart';
import 'package:praveen_website/widgets/footer.dart';
import 'package:praveen_website/core/styles/app_size.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppSpacing.h64 * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(LucideIcons.arrowLeft),
                      onPressed: () => context.go('/'),
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        padding: EdgeInsets.all(AppSpacing.w12),
                      ),
                    ),
                    SizedBox(width: AppSpacing.w24),
                    Text(
                      'Support',
                      style: AppTextStyles.splashHeading(
                        context,
                        fontSize: AppSize.headingLarge,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.w32,
                    vertical: AppSpacing.h64,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'How can we help you?',
                        style: AppTextStyles.body(
                          context,
                          fontSize: AppSize.headingSmall,
                        ),
                      ),
                      SizedBox(height: AppSpacing.h24),
                      Text(
                        'For any queries, please reach out to us at: support@praveenapps.com',
                        style: AppTextStyles.body(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.h64),
                Footer(
                  onHomePressed: () => context.go('/'),

                  onExperiencePressed: () => context.go('/'),
                  onProductsPressed: () => context.go('/'),
                  onContactPressed: () => context.go('/'),
                  onPrivacyPressed: () => context.go('/privacy-policy'),
                  onTermsPressed: () => context.go('/terms'),
                  onSupportPressed: () => context.go('/support'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onHomePressed: () => context.go('/'),

              onExperiencePressed: () => context.go('/'),
              onSkillsPressed: () => context.go('/'),
              onProductsPressed: () => context.go('/'),
              onAboutPressed: () => context.go('/'),
              onContactPressed: () => context.go('/'),
            ),
          ),
        ],
      ),
    );
  }
}
