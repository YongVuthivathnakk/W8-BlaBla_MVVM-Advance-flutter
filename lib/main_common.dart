import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/theme/theme.dart';

void mainCommon(List<InheritedProvider> providers) {
  runApp(MultiProvider(providers: providers, child: BlaBlaApp()));
}

void main() {
  runApp(const BlaBlaApp());
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: Scaffold(body: HomeScreen()),
    );
  }
}
