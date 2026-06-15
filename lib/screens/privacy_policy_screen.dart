import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/widgets/navbar.dart';
import 'package:praveen_website/widgets/footer.dart';
import 'package:praveen_website/core/styles/app_size.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                      'Privacy Policy',
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
                          'Your privacy is important to us. It is Praveen Apps\' policy to respect your privacy regarding any information we may collect from you across our website and other sites we own and operate.',
                          style: AppTextStyles.body(context),
                        ),
                        SizedBox(height: AppSpacing.h24),
                        Text(
                          '1. Information We Collect',
                          style: AppTextStyles.heading(
                            context,
                            fontSize: AppSize.headingSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.h12),
                        Text(
                          'We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.',
                          style: AppTextStyles.body(context),
                        ),
                        SizedBox(height: AppSpacing.h24),
                        Text(
                          '2. Data Storage',
                          style: AppTextStyles.heading(
                            context,
                            fontSize: AppSize.headingSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.h12),
                        Text(
                          'We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.',
                          style: AppTextStyles.body(context),
                        ),
                        SizedBox(height: AppSpacing.h24),
                        Text(
                          '3. Third-Party Sharing',
                          style: AppTextStyles.heading(
                            context,
                            fontSize: AppSize.headingSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.h12),
                        Text(
                          'We don’t share any personally identifying information publicly or with third-parties, except when required to by law.',
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
