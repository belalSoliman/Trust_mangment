// the entry point of the app
import 'package:flutter/material.dart';
import 'package:trust/views/home/home.dart';

class TrustApp extends StatelessWidget {
  const TrustApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trust Customer Acounting",
      home: HomeView(),
    );
  }
}
