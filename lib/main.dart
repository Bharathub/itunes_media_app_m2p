import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';
import 'view/media_selection/media_selection_screen.dart';
import 'view/root_detection/root_detection_screen.dart';
import 'view/search/search_screen.dart';
import 'view/search_result/search_result_screen.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.resources.color.primaryColor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
        ),
      ),
      routes: {
        MediaSelectionScreen.id: (context) => const MediaSelectionScreen(),
        SearchResultScreen.id: (context) => const SearchResultScreen(),
        SearchScreen.id: (context) => const SearchScreen(),
      },
      home: const RootDetectionApp(),
    );
  }
}
