import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/utils/link_helper.dart';
import 'package:praveen_website/core/styles/app_size.dart';
import 'package:praveen_website/widgets/common/hover_scale_card.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      {
        'name': 'Finzo - (Smart Money Tracker)',
        'desc':
            'Automatic money tracking through SMS. Secure, user-friendly, and features auto-categorization of your expenses.',
        'status': 'Available on Google Play',
        'color': AppColors.black,
        'url':
            'https://play.google.com/store/apps/details?id=com.smart_money_tracker',
        'iconAsset': 'assets/images/finzo.png',
        'mockupAsset': 'assets/images/hero_image.png',
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.h64,
        horizontal: AppSpacing.w24,
      ),
      color: AppColors.lightSecondaryBackgroundColor,
      child: Column(
        children: [
          Text(
            'Products I Have Built',
            style: AppTextStyles.splashHeading(context, fontSize: 32),
          ),
          SizedBox(height: AppSpacing.h16),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSize.maxAppCardWidth,
            ),
            child: Text(
              'Discover our range of applications designed to simplify your life and connect you with others.',
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle(
                context,
                color: AppColors.darkSecondaryText,
              ),
            ),
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ), // Added constraints to align with other sections
            child: Column(
              children: apps
                  .map(
                    (app) => Padding(
                      padding: EdgeInsets.only(bottom: AppSpacing.h24),
                      child: _AppCard(app: app),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  final Map<String, dynamic> app;
  const _AppCard({required this.app});

  @override
  Widget build(BuildContext context) {
    final bool isComingSoon = app['status'] == 'Coming Soon';
    final isDesktop =
        MediaQuery.of(context).size.width >
        900; // slightly larger breakpoint for desktop

    Widget leftContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Big App Icon inside a popping White Card
        HoverScaleCard(
          child: GestureDetector(
            onTap: () => LinkHelper.launchURL(app['url'] as String),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white, // Always white so it pops
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: app['iconAsset'] != null
                    ? Image.asset(
                        app['iconAsset'],
                        width: isDesktop ? 160 : 100,
                        height: isDesktop ? 160 : 100,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        LucideIcons.appWindow,
                        size: isDesktop ? 160 : 100,
                        color: app['color'],
                      ),
              ),
            ),
          ),
        ),
        SizedBox(height: AppSpacing.h32),
        // App Name
        Text(
          app['name'],
          style: AppTextStyles.heading(
            context,
            fontSize: isDesktop ? 48 : 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSpacing.h16),
        // Description with Highlighted Features
        RichText(
          text: TextSpan(
            style: AppTextStyles.body(
              context,
              fontSize: 20, // Make it bigger
            ),
            children: [
              const TextSpan(
                text: 'An intelligent personal finance app that features ',
              ),
              TextSpan(
                text: 'Auto Detect SMS',
                style: TextStyle(
                  color: app['color'] as Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' for seamless tracking and '),
              TextSpan(
                text: 'Auto Categorise',
                style: TextStyle(
                  color: app['color'] as Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: ' to organize your expenses effortlessly. It provides ',
              ),
              TextSpan(
                text: 'Smart Insights',
                style: TextStyle(
                  color: app['color'] as Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: ' into your spending habits while remaining completely ',
              ),
              TextSpan(
                text: 'Secure & Private',
                style: TextStyle(
                  color: app['color'] as Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.h48),

        // Google Play Button and Status
      ],
    );

    Widget rightContent = Container(
      // Mockups area (50%)
      alignment: Alignment.center,
      child: app['mockupAsset'] != null
          ? Transform.scale(
              scale: 1.4, // Scale up the image
              child: Image.asset(
                app['mockupAsset'] as String,
                fit: BoxFit.contain,
                filterQuality: FilterQuality
                    .high, // THIS prevents the blurriness when scaling!
                errorBuilder: (context, error, stackTrace) {
                  return _buildMockupPlaceholder(context);
                },
              ),
            )
          : _buildMockupPlaceholder(context),
    );

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? AppSpacing.h64 : AppSpacing.h32,
      ),
      // Removed the card background, border, and shadows
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: leftContent), // 50% width
                const SizedBox(width: 120), // Massive gap to prevent the scaled image from overlapping the text
                Expanded(child: rightContent), // 50% width
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leftContent,
                SizedBox(height: AppSpacing.h48),
                rightContent,
              ],
            ),
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }

  Widget _buildMockupPlaceholder(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Center(
        child: Text(
          'Mockups Image Goes Here',
          style: AppTextStyles.body(
            context,
            color: AppColors.darkSecondaryText,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => LinkHelper.launchURL(app['url']),
      icon: Icon(LucideIcons.play, size: AppSize.iconSmall / 1.5),
      label: Text(
        'Google Play',
        style: AppTextStyles.small(
          context,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.inputRadius),
        ),
      ),
    );
  }
}
