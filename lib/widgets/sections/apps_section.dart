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
        'name': 'Finzo',
        'color': const Color(0xFF1E5128), // Rich Green for Finzo
        'url':
            'https://play.google.com/store/apps/details?id=com.smart_money_tracker',
        'iconAsset': 'assets/images/finzo.png',
        'mockupAsset': 'assets/images/finzo_mockup_v2.png',
        'problem': 'Tracking expenses manually is fundamentally broken. It is tedious, error-prone, and incredibly time-consuming. Most users abandon budgeting apps within weeks because logging every single purchase feels like a second job.',
        'existingSolutions': 'The market offers a terrible choice: either waste hours on soul-crushing manual data entry, or hand over your highly sensitive bank login credentials to third parties, putting your financial security and privacy at serious risk.',
        'solution': 'Finzo intelligently extracts every detail from your transaction SMS—including bank name, payment method, amount, date, and time. It runs entirely on-device, meaning your data never leaves your phone.',
        'features': [
          'Auto-categorization with manual sub-categories',
          'Detailed expense analysis & charts',
          'Export reports as PDF, Excel, or CSV',
          'Secure & private'
        ],
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
          SizedBox(height: AppSpacing.h64), // Added spacing before the card
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200, // Re-added constraints for the cards
            ),
            child: Column(
              children: apps
                  .map(
                    (app) => Padding(
                      padding: EdgeInsets.only(bottom: AppSpacing.h64),
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
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final primaryColor = app['color'] as Color;

    // --- BOTTOM CONTEXT CARDS ---
    Widget problemCard = Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.lightSecondaryBackgroundColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(LucideIcons.alertCircle, color: Colors.redAccent, size: 28),
              const SizedBox(width: 12),
              Expanded(child: Text('The Problem', style: AppTextStyles.heading(context, fontSize: 24, fontWeight: FontWeight.w800))),
            ],
          ),
          const SizedBox(height: 16),
          Text(app['problem'], style: AppTextStyles.body(context, color: AppColors.darkSecondaryText, fontSize: 16)),
        ],
      ),
    );

    Widget existingSolutionsCard = Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.lightSecondaryBackgroundColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(LucideIcons.xCircle, color: Colors.orangeAccent, size: 28),
              const SizedBox(width: 12),
              Expanded(child: Text('Existing Solutions', style: AppTextStyles.heading(context, fontSize: 24, fontWeight: FontWeight.w800))),
            ],
          ),
          const SizedBox(height: 16),
          Text(app['existingSolutions'], style: AppTextStyles.body(context, color: AppColors.darkSecondaryText, fontSize: 16)),
        ],
      ),
    );

    // --- TOP PRODUCT HERO CARD ---
    Widget productInfoAndFeatures = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App Identity
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: primaryColor.withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 8)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: app['iconAsset'] != null
                    ? Image.asset(app['iconAsset'], width: 48, height: 48, fit: BoxFit.contain)
                    : Icon(LucideIcons.appWindow, size: 48, color: primaryColor),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(child: Text(app['name'], style: AppTextStyles.heading(context, fontSize: 36, fontWeight: FontWeight.w800))),
          ],
        ),
        const SizedBox(height: 24),
        // Description / Solution Text
        Text(app['solution'], style: AppTextStyles.body(context, color: AppColors.darkSecondaryText, fontSize: 18)),
        const SizedBox(height: 32),
        // Features
        Text('Key Features', style: AppTextStyles.heading(context, fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        ...((app['features'] as List<String>).map((feature) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(LucideIcons.sparkles, color: primaryColor, size: 20),
              const SizedBox(width: 12),
              Expanded(child: Text(feature, style: AppTextStyles.body(context, fontSize: 16))),
            ],
          ),
        ))),
        const SizedBox(height: 48),
        // CTA
        _buildPlayButton(context, primaryColor),
      ],
    );

    Widget largeMockup = app['mockupAsset'] != null
        ? Image.asset(
            app['mockupAsset'] as String,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            isAntiAlias: true,
          )
        : _buildMockupPlaceholder(context);

    Widget topProductCard = Container(
      padding: EdgeInsets.all(isDesktop ? 48 : 32),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: primaryColor.withOpacity(0.1)),
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: productInfoAndFeatures),
                const SizedBox(width: 48),
                Expanded(flex: 7, child: largeMockup),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productInfoAndFeatures,
                const SizedBox(height: 48),
                largeMockup,
              ],
            ),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        children: [
          topProductCard,
          SizedBox(height: AppSpacing.h24),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: problemCard),
                    SizedBox(width: AppSpacing.w24),
                    Expanded(child: existingSolutionsCard),
                  ],
                )
              : Column(
                  children: [
                    problemCard,
                    SizedBox(height: AppSpacing.h24),
                    existingSolutionsCard,
                  ],
                ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutQuart);
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

  Widget _buildPlayButton(BuildContext context, Color color) {
    return HoverScaleCard(
      // Add a nice scale animation on hover
      child: ElevatedButton.icon(
        onPressed: () => LinkHelper.launchURL(app['url']),
        icon: const Icon(LucideIcons.play, size: 24, color: Colors.white),
        label: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Get it on Google Play',
            style: AppTextStyles.body(
              context,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Use brand color for button
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          elevation: 0, // Flat design
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), // Pill shape is more modern
          ),
        ),
      ),
    );
  }
}
