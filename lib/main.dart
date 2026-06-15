import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:praveen_website/theme/app_theme.dart';
import 'package:praveen_website/screens/home_screen.dart';
import 'package:praveen_website/screens/privacy_policy_screen.dart';
import 'package:praveen_website/screens/support_screen.dart';
import 'package:praveen_website/screens/terms_conditions_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:praveen_website/firebase_options.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PraveenAppsApp());
}

class PraveenAppsApp extends StatelessWidget {
  const PraveenAppsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/privacy-policy', builder: (context, state) => const PrivacyPolicyScreen()),
        GoRoute(path: '/support', builder: (context, state) => const SupportScreen()),
        GoRoute(path: '/terms', builder: (context, state) => const TermsConditionsScreen()),
      ],
    );

    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ToastificationWrapper(
          child: MaterialApp.router(
            title: 'Praveen Apps',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            routerConfig: _router,
          ),
        );
      },
    );
  }
}
