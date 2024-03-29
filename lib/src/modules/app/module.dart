import 'package:app/src/core/theme.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:app/src/modules/maps/module.dart';
import 'package:app/src/modules/order/module.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  final authModule = AuthModule();
  final orderModule = OrderModule();
  final mapsModule = MapsModule();
  final analytics = FirebaseAnalytics();
  @override
  List<Bind> get binds => [
        ...authModule.binds,
        ...orderModule.binds,
        ...mapsModule.binds,
        Bind((i) => analytics),
      ];

  @override
  List<Router> get routers => [
        Router('', module: authModule),
        Router('', module: orderModule),
        Router('', module: mapsModule),
      ];

  @override
  Widget get bootstrap => AppWidget(analytics: analytics);
}

class AppWidget extends StatelessWidget {
  final FirebaseAnalytics analytics;

  AppWidget({@required this.analytics});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
      navigatorObservers: [
        BotToastNavigatorObserver(),
        FirebaseAnalyticsObserver(analytics: analytics),
        RouteObserver<PageRoute>(),
      ],
      theme: themeData,
    );
  }
}
