// Flutter imports:
import 'package:crowwn/features/brokers/presentation/providers/binance_provider.dart';
import 'package:crowwn/features/brokers/presentation/providers/delta_provider.dart';
import 'package:crowwn/features/bot/presentation/providers/signals_provider.dart';
import 'package:crowwn/features/groups/presentation/providers/groups_provider.dart';
import 'package:crowwn/features/subscriptions/presentation/providers/subscriptions_provider.dart';
import 'package:crowwn/features/user_signals/presentation/providers/user_signals_provider.dart';
import 'package:flutter/foundation.dart';
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
import 'package:crowwn/features/home/presentation/providers/bot_provider.dart';
import 'package:crowwn/features/user_signals/data/repositories/user_signals_repository_impl.dart';
import 'package:crowwn/features/user_signals/data/services/user_signals_service.dart';
import 'firebase_options.dart';
import 'services/api_service.dart';
import 'services/auth_service.dart';
import 'services/auth_storage_service.dart';
import 'services/binance_service.dart';
import 'services/delta_service.dart';
import 'package:crowwn/features/profile/presentation/providers/profile_provider.dart';
import 'package:crowwn/features/profile/data/repositories/profile_repository_impl.dart';
import 'features/bot/data/services/bot_subscription_service.dart';
import 'features/bot/presentation/providers/bot_details_provider.dart';
import 'repositories/signal_repository.dart';

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
            const debugApiUrl = String.fromEnvironment('DEBUG_API_URL');
            const productionApiUrl =
                String.fromEnvironment('PRODUCTION_API_URL');
            return ApiService(
              baseUrl: kDebugMode ? debugApiUrl : productionApiUrl,
              authStorage: context.read<AuthStorageService>(),
            );
          },
        ),
        Provider<BinanceService>(
          create: (context) {
            return BinanceService(
              apiService: context.read<ApiService>(),
            );
          },
        ),
        Provider<DeltaService>(
          create: (context) {
            return DeltaService(
              apiService: context.read<ApiService>(),
            );
          },
        ),
        Provider<SignalRepository>(
          create: (context) {
            return SignalRepository(
              apiService: context.read<ApiService>(),
            );
          },
        ),
        Provider<BotSubscriptionService>(
          create: (context) {
            return BotSubscriptionService(
              apiService: context.read<ApiService>(),
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
            return BinanceProvider(
              binanceService: context.read<BinanceService>(),
              authStorage: context.read<AuthStorageService>(),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return DeltaProvider(
              deltaService: context.read<DeltaService>(),
              authStorage: context.read<AuthStorageService>(),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return SignalsProvider(
              signalRepository: context.read<SignalRepository>(),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return KYCProvider(KYCRepositoryImpl(context.read<ApiService>()));
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProfileProvider(
              ProfileRepositoryImpl(context.read<ApiService>()),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return BotProvider(
              context.read<ApiService>(),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return GroupsProvider(
              context.read<ApiService>(),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return BotDetailsProvider(
              subscriptionService: context.read<BotSubscriptionService>(),
              apiService: context.read<ApiService>(),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return UserSignalsProvider(
              userSignalsRepository: UserSignalsRepositoryImpl(
                userSignalsService: UserSignalsService(
                  apiService: context.read<ApiService>(),
                ),
              ),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return SubscriptionsProvider(
              context.read<ApiService>(),
            );
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
