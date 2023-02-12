import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/riverpod/provider_observer.dart';
import 'package:study_riverpod/screens/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
