import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/styles/app_size.dart';
import 'package:praveen_website/core/utils/link_helper.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:praveen_website/widgets/common/skill_card.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onViewAppsPressed;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    required this.onViewAppsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.h64 * 1.5,
        horizontal: MediaQuery.of(context).size.width > 900
            ? AppSpacing.w64
            : AppSpacing.w24,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 900;
          return Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              // Background Watermarks
              Positioned(
                left: -50,
                top: 0,
                child: Opacity(
                  opacity: isDark ? 0.03 : 0.03,
                  child: Transform.rotate(
                    angle: -0.2,
                    child: Icon(
                      SimpleIcons.flutter,
                      size: isDesktop ? 400 : 250,
                      color: const Color(0xFF02569B),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -50,
                bottom: 50,
                child: Opacity(
                  opacity: isDark ? 0.03 : 0.03,
                  child: Transform.rotate(
                    angle: 0.2,
                    child: Icon(
                      SimpleIcons.postgresql,
                      size: isDesktop ? 350 : 200,
                      color: const Color(0xFF336791),
                    ),
                  ),
                ),
              ),

              // Main Content
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1000,
                  ), // Max width to keep it readable
                  child: _buildTextContent(context, isDark, isDesktop),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isDark, bool isDesktop) {
    // Always centered now since the image on the right was removed
    const textAlign = TextAlign.center;
    const crossAxisAlignment = CrossAxisAlignment.center;
    const wrapAlignment = WrapAlignment.center;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
              'Full Stack Developer &\nProduct Builder',
              textAlign: textAlign,
              style: AppTextStyles.splashHeading(
                context,
                color: isDark ? AppColors.white : AppColors.lightText,
              ),
            )
            .animate()
            .fadeIn(delay: 100.ms, duration: 500.ms)
            .slideX(begin: isDesktop ? -0.2 : 0, end: 0)
            .slideY(begin: isDesktop ? 0 : 0.2, end: 0),

        SizedBox(height: AppSpacing.h24),

        Text(
              'I build scalable mobile applications, web platforms, and digital products that solve real-world problems.',
              textAlign: textAlign,
              style: AppTextStyles.subtitle(
                context,
                color: isDark ? AppColors.white : AppColors.lightText,
              ),
            )
            .animate()
            .fadeIn(delay: 150.ms, duration: 500.ms)
            .slideX(begin: isDesktop ? -0.2 : 0, end: 0)
            .slideY(begin: isDesktop ? 0 : 0.2, end: 0),

        SizedBox(height: AppSpacing.h16),

        ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 500 : 600),
              child: Text(
                'Passionate about transforming ideas into production-ready applications using modern technologies.',
                textAlign: textAlign,
                style: AppTextStyles.body(
                  context,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.lightSecondaryText,
                ),
              ),
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 500.ms)
            .slideX(begin: isDesktop ? -0.2 : 0, end: 0)
            .slideY(begin: isDesktop ? 0 : 0.2, end: 0),

        SizedBox(height: AppSpacing.h32),

        Wrap(
          spacing: AppSpacing.w16,
          runSpacing: AppSpacing.h16,
          alignment: wrapAlignment,
          children: [
            SkillCard(
              title: 'Flutter',
              icon: SimpleIcons.flutter,
              iconColor: const Color(0xFF02569B),
              delay: 200,
              size: 120,
              iconSize: 32,
            ),
            SkillCard(
              title: 'Firebase',
              icon: SimpleIcons.firebase,
              iconColor: const Color(0xFFFFCA28),
              delay: 250,
              size: 120,
              iconSize: 32,
            ),
            SkillCard(
              title: 'FastAPI',
              icon: SimpleIcons.fastapi,
              iconColor: const Color(0xFF009688),
              delay: 300,
              size: 120,
              iconSize: 32,
            ),
            SkillCard(
              title: 'Postgres',
              icon: SimpleIcons.postgresql,
              iconColor: const Color(0xFF336791),
              delay: 350,
              size: 120,
              iconSize: 32,
            ),
            SkillCard(
              title: 'AWS',
              icon: LucideIcons.cloud,
              iconColor: const Color(0xFFFF9900),
              delay: 400,
              size: 120,
              iconSize: 32,
            ),
          ],
        ),

        SizedBox(height: AppSpacing.h48),

        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: wrapAlignment,
          children: [
            ElevatedButton(
                  onPressed: onViewAppsPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.w32,
                      vertical: AppSpacing.h24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.buttonRadius),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('View Aps', style: AppTextStyles.button(context)),
                      SizedBox(width: AppSpacing.w8),
                      Icon(LucideIcons.arrowRight, size: AppSize.iconSmall),
                    ],
                  ),
                )
                .animate()
                .fadeIn(delay: 300.ms, duration: 500.ms)
                .slideY(begin: 0.2, end: 0),
            OutlinedButton(
                  onPressed: () => LinkHelper.launchURL(
                    'assets/resume.pdf',
                  ), // Update this link with your actual resume URL or file!
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDark
                        ? AppColors.white
                        : AppColors.lightText,
                    side: BorderSide(
                      color: isDark
                          ? AppColors.darkBorder
                          : AppColors.lightBorder,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.w32,
                      vertical: AppSpacing.h24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.buttonRadius),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Download Resume',
                        style: AppTextStyles.button(
                          context,
                          color: isDark ? Colors.white : AppColors.lightText,
                        ),
                      ),
                      SizedBox(width: AppSpacing.w8),
                      Icon(LucideIcons.download, size: AppSize.iconSmall),
                    ],
                  ),
                )
                .animate()
                .fadeIn(delay: 350.ms, duration: 500.ms)
                .slideY(begin: 0.2, end: 0),
          ],
        ),

        SizedBox(height: AppSpacing.h64),

        // Statistics Section
      ],
    );
  }

  Widget _buildImageContent(BuildContext context, bool isDark) {
    return Image.asset(
      'assets/images/hero_image.png',
      fit: BoxFit.fitHeight,
    ).animate().fadeIn(delay: 200.ms, duration: 800.ms);
    //     .slideX(begin: 0.2, end: 0);
    // return Container(
    //       constraints: const BoxConstraints(maxHeight: 600),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(32),
    //         boxShadow: [
    //           BoxShadow(
    //             color: AppColors.primaryAccent.withOpacity(0.15),
    //             blurRadius: 60,
    //             offset: const Offset(0, 20),
    //           ),
    //           BoxShadow(
    //             color: isDark
    //                 ? Colors.black.withOpacity(0.5)
    //                 : Colors.black.withOpacity(0.1),
    //             blurRadius: 30,
    //             offset: const Offset(0, 10),
    //           ),
    //         ],
    //       ),
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(32),
    //         child: Stack(
    //           alignment: Alignment.center,
    //           children: [
    //             Image.asset('assets/images/hero_image.png', fit: BoxFit.cover),
    //             // Optional glow overlay
    //             Container(
    //               decoration: BoxDecoration(
    //                 gradient: LinearGradient(
    //                   begin: Alignment.topCenter,
    //                   end: Alignment.bottomCenter,
    //                   colors: [
    //                     Colors.transparent,
    //                     isDark
    //                         ? AppColors.darkBackground.withOpacity(0.8)
    //                         : Colors.transparent,
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     )
    //     .animate()
    //     .fadeIn(delay: 200.ms, duration: 800.ms)
    //     .slideX(begin: 0.2, end: 0);
  }

  Widget _StatItem(BuildContext context, String value, String label) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTextStyles.heading(
            context,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryAccent,
          ),
        ),
        SizedBox(height: AppSpacing.h4),
        Text(
          label,
          style: AppTextStyles.small(
            context,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.lightSecondaryText,
          ),
        ),
      ],
    );
  }
}
