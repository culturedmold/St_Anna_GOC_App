import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/view/navigation_bar/navigation_bar_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_access/firebase_options.dart';

void main() async {
  runApp(const StAnnaGOCApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class StAnnaGOCApp extends StatelessWidget {
  const StAnnaGOCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "St Anna GOC",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        useMaterial3: true,
      ),
      home: const NavigationBarView(),
    );
  }
}

