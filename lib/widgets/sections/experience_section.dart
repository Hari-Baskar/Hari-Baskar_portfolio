import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      ),
      child: Stack(
        children: [
          // Background Opacity Images/Icons on the sides
          Positioned(
            left: -50,
            top: 200,
            child: Icon(
              LucideIcons.code2,
              size: 300,
              color: AppColors.primaryAccent.withOpacity(0.03),
            ),
          ),
          Positioned(
            right: -100,
            bottom: 300,
            child: Icon(
              LucideIcons.terminalSquare,
              size: 400,
              color: AppColors.primaryAccent.withOpacity(0.03),
            ),
          ),

          // Main Content
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.h64 * 1.5,
              horizontal: AppSpacing.w24,
            ),
            child: Column(
              children: [
                Text(
                  'EXPERIENCE',
                  style: AppTextStyles.heading(
                    context,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),

                SizedBox(height: AppSpacing.h16),

                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.primaryAccent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ).animate().fadeIn(delay: 200.ms).scaleX(),

                SizedBox(height: AppSpacing.h64),

                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 1600,
                    ), // Taken full width but constrained for readability
                    child: Column(
                      children: [
                        _TimelineItem(
                          title: 'Full Stack Developer Intern',
                          company: 'Dotwings Software Solutions',
                          date: 'Jan 2026 - Jun 2026',
                          badgeColor: Colors.teal,
                          badgeIcon: LucideIcons.rocket,
                          technologies:
                              'Flutter • Firebase • Riverpod • REST APIs',
                          bullets: const [
                            'Integrated Firebase Crashlytics, Analytics, Performance Monitoring, and Dynamic Links across multiple applications.',
                          ],
                          apps: const [
                            {
                              'name': 'Bubbles Blood Donation',
                              'percentage': 100,
                              'url':
                                  'https://play.google.com/store/apps/details?id=com.bubbles.blooddonation&pcampaignid=web_share',
                              'iconAsset': 'assets/images/bubbles_icon.png',
                              'roles': [
                                'Built the full frontend from scratch using Riverpod and Feature-First Clean Architecture.',
                                'Integrated REST APIs and implemented complex deferred deep linking.',
                              ],
                            },
                            {
                              'name': 'Coconut Market',
                              'percentage': 90,
                              'url':
                                  'https://play.google.com/store/search?q=Cocnut%20Market%20App&c=apps&hl=en_IN',
                              'iconAsset': 'assets/images/coconut_icon.png',
                              'roles': [
                                'Led the migration of the legacy codebase from BLoC to Riverpod state management.',
                                'Restructured the entire application to follow a Feature-First Clean Architecture pattern.',
                              ],
                            },
                            {
                              'name': 'Sri Hari Vidyapathi',
                              'percentage': 10,
                              'url':
                                  'https://play.google.com/store/apps/details?id=com.srihari.vidyapathi&pcampaignid=web_share',
                              'iconAsset': 'assets/images/srihari_icon.png',
                              'roles': [
                                'Developed and integrated a real-time chat system using socket-based communication.',
                                'Resolved critical production bugs to improve application stability.',
                              ],
                            },
                            {
                              'name': 'Paal Dappa',
                              'percentage': 5,
                              'url':
                                  'https://play.google.com/store/apps/details?id=com.paaldappa.user&pcampaignid=web_share',
                              'iconAsset': 'assets/images/paaldappa_icon.png',
                              'roles': [
                                'Implemented deep linking for seamless user navigation.',
                                'Applied UI enhancements and fixed production bugs.',
                              ],
                            },
                          ],
                          delay: 200,
                          isLast: false,
                        ),
                        _TimelineItem(
                          title: 'Full Stack Developer (EdTech)',
                          company: 'Vidhaan Educare Pvt. Ltd',
                          date: 'Feb 2025 - Jul 2025',
                          badgeColor: Colors.amber.shade600,
                          badgeIcon: LucideIcons.search,
                          technologies: 'Flutter • Firebase',
                          bullets: const [
                            'Built full-stack SaaS software for schools, covering user onboarding, admin dashboards, and student management.',
                            'Participated in front-end UI design using Flutter and backend feature implementation.',
                            'Collaborated in sprint-based cycles, contributing to testing and documentation.',
                          ],
                          delay: 300,
                          isLast: false,
                        ),
                        _TimelineItem(
                          title: 'App Developer Intern',
                          company: 'El Datos Technologies Pvt. Ltd',
                          date: 'Nov 2024 - Dec 2024',
                          badgeColor: Colors.redAccent,
                          badgeIcon: LucideIcons.network,
                          technologies: 'Flutter • Firebase',
                          bullets: const [
                            'Developed a platform connecting students with mentors for guidance and skill development.',
                            'Implemented features including mentor search, booking sessions, and real-time chat.',
                            'Built user-friendly UI with Flutter and reusable components for a smooth experience.',
                          ],
                          delay: 400,
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String company;
  final String date;
  final Color badgeColor;
  final IconData badgeIcon;
  final String? technologies;
  final List<String> bullets;
  final List<Map<String, dynamic>>? apps;
  final int delay;
  final bool isLast;

  const _TimelineItem({
    required this.title,
    required this.company,
    required this.date,
    required this.badgeColor,
    required this.badgeIcon,
    this.technologies,
    required this.bullets,
    this.apps,
    required this.delay,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Stack(
          children: [
            // MIDDLE: Vertical Line
            Positioned(
              left: (isMobile ? 100 : 180) + (isMobile ? 24 : 40) / 2 - 1,
              top: 0,
              bottom: 0,
              child: Container(
                width: 2,
                color: isDark ? AppColors.darkBorder : Colors.grey.shade300,
              ),
            ),
            // Content Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT SIDE: Badge + Company Name
                SizedBox(
                  width: isMobile ? 100 : 180,
                  child: Column(
                    children: [
                      Container(
                        width: isMobile ? 64 : 100,
                        height: isMobile ? 64 : 100,
                        decoration: BoxDecoration(
                          color: badgeColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: badgeColor.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            badgeIcon,
                            color: Colors.white,
                            size: isMobile ? 32 : 48,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSpacing.h16),
                      Text(
                        company.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body(
                          context,
                          fontWeight: FontWeight.bold,
                          color: badgeColor,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // MIDDLE: Spacer for Vertical Line
                SizedBox(width: isMobile ? 24 : 40),

                // RIGHT SIDE: Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: AppSpacing.h64 * 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.heading(
                            context,
                            fontSize: isMobile ? 20 : 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.h4),
                        Text(
                          date,
                          style: AppTextStyles.body(
                            context,
                            color: isDark
                                ? AppColors.darkSecondaryText
                                : AppColors.lightSecondaryText,
                          ),
                        ),
                        if (technologies != null) ...[
                          SizedBox(height: AppSpacing.h12),
                          RichText(
                            text: TextSpan(
                              style: AppTextStyles.body(
                                context,
                                color: isDark
                                    ? AppColors.darkSecondaryText
                                    : AppColors.lightSecondaryText,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Technologies Used: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: badgeColor,
                                  ),
                                ),
                                TextSpan(text: technologies),
                              ],
                            ),
                          ),
                        ],
                        SizedBox(height: AppSpacing.h24),

                        // Render General Company Bullets
                        if (bullets.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: bullets
                                .map(
                                  (bullet) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: AppSpacing.h12,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8,
                                          ),
                                          child: Container(
                                            width: 6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              color: badgeColor,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: AppSpacing.w16),
                                        Expanded(
                                          child: Text(
                                            bullet,
                                            style: AppTextStyles.body(
                                              context,
                                              color: isDark
                                                  ? AppColors.darkSecondaryText
                                                  : AppColors
                                                        .lightSecondaryText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),

                        // Render App-Specific Details
                        if (apps != null && apps!.isNotEmpty) ...[
                          SizedBox(height: AppSpacing.h24),
                          if (isMobile)
                            Column(
                              children: apps!
                                  .map(
                                    (app) => Padding(
                                      padding: EdgeInsets.only(
                                        bottom: AppSpacing.h16,
                                      ),
                                      child: _AppDetailCard(
                                        app: app,
                                        accentColor: badgeColor,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          else
                            Wrap(
                              spacing: AppSpacing.w24,
                              runSpacing: AppSpacing.h24,
                              children: apps!
                                  .map(
                                    (app) => SizedBox(
                                      width:
                                          320, // Give a reasonable fixed width for the cards in Wrap
                                      child: _AppDetailCard(
                                        app: app,
                                        accentColor: badgeColor,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
        .animate()
        .fadeIn(delay: delay.ms, duration: 600.ms)
        .slideY(begin: 0.1, end: 0);
  }
}

class _AppDetailCard extends StatelessWidget {
  final Map<String, dynamic> app;
  final Color accentColor;

  const _AppDetailCard({required this.app, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final roles = app['roles'] as List<String>? ?? [];

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: app['url'] != null
              ? () async {
                  final url = Uri.parse(app['url'] as String);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                }
              : null,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.w24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (app['iconAsset'] != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          app['iconAsset'] as String,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: accentColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  LucideIcons.smartphone,
                                  color: accentColor,
                                ),
                              ),
                        ),
                      )
                    else
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(LucideIcons.smartphone, color: accentColor),
                      ),
                    SizedBox(width: AppSpacing.w16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            app['name'] as String,
                            style: AppTextStyles.heading(
                              context,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: AppSpacing.h4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: accentColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: accentColor.withOpacity(0.5),
                                  ),
                                ),
                                child: Text(
                                  'Contribution: ${app['percentage']}%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (app['url'] != null) ...[
                                SizedBox(width: AppSpacing.w8),
                                Icon(
                                  LucideIcons.externalLink,
                                  size: 14,
                                  color: isDark
                                      ? AppColors.darkSecondaryText
                                      : AppColors.lightSecondaryText,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                if (roles.isNotEmpty) ...[
                  SizedBox(height: AppSpacing.h16),
                  Divider(
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                  SizedBox(height: AppSpacing.h12),
                  Text(
                    'Key Contributions:',
                    style: AppTextStyles.small(
                      context,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? AppColors.darkSecondaryText
                          : AppColors.lightSecondaryText,
                    ),
                  ),
                  SizedBox(height: AppSpacing.h8),
                  ...roles.map(
                    (role) => Padding(
                      padding: EdgeInsets.only(bottom: AppSpacing.h4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Icon(
                              LucideIcons.checkCircle2,
                              size: 12,
                              color: accentColor,
                            ),
                          ),
                          SizedBox(width: AppSpacing.w12),
                          Expanded(
                            child: Text(
                              role,
                              style: AppTextStyles.body(
                                context,
                                color: isDark
                                    ? AppColors.darkSecondaryText
                                    : AppColors.lightSecondaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
