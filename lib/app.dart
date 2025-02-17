// the entry point of the app
import 'package:flutter/material.dart';
import 'package:trust/core/navigation/app_route.dart';
import 'package:trust/core/navigation/routes.dart';
import 'package:trust/views/home/home.dart';

class TrustApp extends StatelessWidget {
  const TrustApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trust Customer Acounting",
      initialRoute: Routes.homeView, // Set the initial route
      onGenerateRoute: AppRoute().generateRoute,
      home: HomeView(),

      debugShowCheckedModeBanner: false,
    );
  }
}
