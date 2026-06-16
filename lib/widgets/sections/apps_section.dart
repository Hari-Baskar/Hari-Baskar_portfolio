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

    Widget leftContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // App Icon
        HoverScaleCard(
          child: GestureDetector(
            onTap: () => LinkHelper.launchURL(app['url'] as String),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.15),
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
                        width: isDesktop ? 120 : 80,
                        height: isDesktop ? 120 : 80,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        LucideIcons.appWindow,
                        size: isDesktop ? 120 : 80,
                        color: primaryColor,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(height: AppSpacing.h48),
        // App Name
        Text(
          app['name'],
          style: AppTextStyles.heading(
            context,
            fontSize: isDesktop ? 48 : 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSpacing.h48),
        
        // Narrative Timeline
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimelineNode(context, 'Problem', 'Manual expense tracking sucks', primaryColor),
            _buildTimelineNode(context, 'Solution', 'SMS-based expense extraction', primaryColor),
            _buildTimelineNode(context, 'Technical Challenge', 'Parsing hundreds of bank formats', primaryColor),
            _buildTimelineNode(context, 'Result', 'Auto categorization + analytics', primaryColor),
            _buildTimelineNode(context, 'Tech', 'Flutter • Firebase • SQLite', primaryColor, isLast: true, isTech: true),
          ],
        ),

        SizedBox(height: AppSpacing.h48),
        // Google Play Button
        _buildPlayButton(context, primaryColor),
      ],
    );

    Widget rightContent = app['mockupAsset'] != null
        ? Image.asset(
            app['mockupAsset'] as String,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          )
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .moveY(begin: -15, end: 15, duration: 4.seconds, curve: Curves.easeInOut)
        : _buildMockupPlaceholder(context);

    return Container(
      padding: EdgeInsets.all(isDesktop ? AppSpacing.h64 : AppSpacing.h32),
      decoration: BoxDecoration(
        color: Colors.white, // Premium clean white card background
        borderRadius: BorderRadius.circular(48), // Huge soft border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
          BoxShadow(
            color: primaryColor.withOpacity(0.05), // Subtle glow of brand color
            blurRadius: 60,
            spreadRadius: -10,
          ),
        ],
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: leftContent),
                SizedBox(width: AppSpacing.w64),
                Expanded(flex: 7, child: rightContent),
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
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutQuart);
  }

  Widget _buildTimelineNode(
    BuildContext context,
    String title,
    String content,
    Color color, {
    bool isLast = false,
    bool isTech = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline graphics
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(top: 4), // align with first line of text
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: color, width: 4),
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: color.withOpacity(0.2),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: AppTextStyles.small(
                      context,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ).copyWith(letterSpacing: 1.2),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: AppTextStyles.body(
                      context,
                      color: isTech ? color : AppColors.darkSecondaryText,
                      fontWeight: isTech ? FontWeight.bold : FontWeight.w500,
                    ).copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
