// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:deriv_chart/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/onboarding/data/repositories/kyc_repository_impl.dart';
import 'package:crowwn/features/onboarding/presentation/providers/kyc_provider.dart';
import 'package:crowwn/features/onboarding/presentation/splash/splash_screen.dart';
import 'firebase_options.dart';
import 'services/api_service.dart';
import 'services/auth_service.dart';
import 'services/auth_storage_service.dart';
import 'package:crowwn/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:crowwn/features/profile/presentation/providers/profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifire()),
        Provider<AuthStorageService>(
          create: (_) => AuthStorageService(),
        ),
        Provider<ApiService>(
          create: (context) {
            const apiUrl = String.fromEnvironment('API_URL');
            return ApiService(
              baseUrl: apiUrl,
              authStorage: context.read<AuthStorageService>(),
            );
          },
        ),
        Provider<AuthService>(
          create: (context) => AuthService(
            context.read<ApiService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) {
            return KYCProvider(KYCRepositoryImpl(context.read<ApiService>()));
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProfileProvider(
                ProfileRepositoryImpl(context.read<ApiService>()));
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff6B39F4),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        ChartLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
      ],
      home: const Splash(),
    );
  }
}
