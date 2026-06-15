import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/widgets/navbar.dart';
import 'package:praveen_website/widgets/footer.dart';
import 'package:praveen_website/core/styles/app_size.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

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
                      'Terms & Conditions',
                      style: AppTextStyles.splashHeading(
                        context,
                        fontSize: AppSize.headingLarge,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.h48),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.w24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppSize.maxTextWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'By accessing our applications, you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws.',
                          style: AppTextStyles.body(context),
                        ),
                        SizedBox(height: AppSpacing.h24),
                        Text(
                          '1. Use License',
                          style: AppTextStyles.heading(
                            context,
                            fontSize: AppSize.headingSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.h12),
                        Text(
                          'Permission is granted to temporarily download one copy of the materials (information or software) on Praveen Apps\' website for personal, non-commercial transitory viewing only.',
                          style: AppTextStyles.body(context),
                        ),
                        SizedBox(height: AppSpacing.h24),
                        Text(
                          '2. Disclaimer',
                          style: AppTextStyles.heading(
                            context,
                            fontSize: AppSize.headingSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.h12),
                        Text(
                          'The materials on Praveen Apps\' website are provided on an \'as is\' basis. Praveen Apps makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
                          style: AppTextStyles.body(context),
                        ),
                      ],
                    ),
                  ),
                ),
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
