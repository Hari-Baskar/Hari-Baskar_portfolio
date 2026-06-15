import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/widgets/navbar.dart';
import 'package:praveen_website/widgets/footer.dart';
import 'package:praveen_website/widgets/sections/hero_section.dart';
import 'package:praveen_website/widgets/sections/featured_achievements_section.dart';
import 'package:praveen_website/widgets/sections/experience_section.dart';
import 'package:praveen_website/widgets/sections/apps_section.dart';
import 'package:praveen_website/widgets/sections/skills_section.dart';
import 'package:praveen_website/widgets/sections/about_section.dart';
import 'package:praveen_website/widgets/sections/contact_section.dart';
import 'package:praveen_website/core/styles/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _productsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkSecondaryBackgroundColor
                      : AppColors.lightSecondaryBackgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor.withOpacity(0.1),
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Menu',
                    style: AppTextStyles.heading(
                      context,
                      fontSize: AppSize.headingMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _DrawerItem(
                icon: Icons.home,
                title: 'Home',
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_homeKey);
                },
              ),
              _DrawerItem(
                icon: Icons.timeline,
                title: 'Experience',
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_experienceKey);
                },
              ),
              _DrawerItem(
                icon: Icons.apps,
                title: 'Products',
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_productsKey);
                },
              ),
              _DrawerItem(
                icon: Icons.code,
                title: 'Skills',
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_skillsKey);
                },
              ),
              _DrawerItem(
                icon: Icons.person_outline,
                title: 'About',
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_aboutKey);
                },
              ),
              _DrawerItem(
                icon: Icons.mail_outline,
                title: 'Contact',
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_contactKey);
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  key: _homeKey,
                  onContactPressed: () => _scrollToSection(_contactKey),
                  onViewAppsPressed: () => _scrollToSection(_productsKey),
                ),
                const CoreExpertiseSection(),
                ExperienceSection(key: _experienceKey),
                AppsSection(key: _productsKey),
                SkillsSection(key: _skillsKey),
                AboutSection(key: _aboutKey),
                ContactSection(key: _contactKey),

                Footer(
                  onHomePressed: () => _scrollToSection(_homeKey),
                  onExperiencePressed: () => _scrollToSection(_experienceKey),
                  onProductsPressed: () => _scrollToSection(_productsKey),
                  onContactPressed: () => _scrollToSection(_contactKey),
                  onPrivacyPressed: () => context.push('/privacy-policy'),
                  onTermsPressed: () => context.push('/terms'),
                  onSupportPressed: () => context.push('/support'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Navbar(
                onHomePressed: () => _scrollToSection(_homeKey),
                onExperiencePressed: () => _scrollToSection(_experienceKey),
                onProductsPressed: () => _scrollToSection(_productsKey),
                onSkillsPressed: () => _scrollToSection(_skillsKey),
                onAboutPressed: () => _scrollToSection(_aboutKey),
                onContactPressed: () => _scrollToSection(_contactKey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.darkSecondaryText),
      title: Text(
        title,
        style: AppTextStyles.body(context, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.w24,
        vertical: AppSpacing.h12,
      ),
    );
  }
}
