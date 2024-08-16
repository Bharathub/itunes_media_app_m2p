import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';
import 'package:m2p_assignment/view/search/search_screen.dart';
import 'package:m2p_assignment/view/shared/text_view.dart';
import 'package:m2p_assignment/view_model/root_detection_view_model.dart';

class RootDetectionScreen extends ConsumerWidget {
  const RootDetectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootState = ref.watch(rootDetectionProvider);
    final resources = context.resources;

    return Scaffold(
      backgroundColor: resources.color.primaryColor,
      appBar: AppBar(
          backgroundColor: resources.color.primaryColor,
          title: const MyTextView(label: 'Root Detection')),
      body: Center(
        child: rootState.rootedCheck
            ? _buildRootedContent(context)
            : _buildNotRootedContent(context),
      ),
    );
  }

  Widget _buildRootedContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.warning, size: 80, color: Colors.red),
        const SizedBox(height: 20),
        const MyTextView(
            label: 'Access Denied',
            fontWeight: FontWeight.bold,
            color: Colors.red),
        const SizedBox(height: 10),
        MyTextView(
          label: 'This app cannot be used on rooted devices.',
          fontWeight: FontWeight.bold,
          fontSize: context.resources.dimension.smallText,
        ),
      ],
    );
  }

  Widget _buildNotRootedContent(BuildContext context) {
    return Container();
  }
}

class RootDetectionApp extends ConsumerStatefulWidget {
  const RootDetectionApp({super.key});

  @override
  _RootDetectionAppState createState() => _RootDetectionAppState();
}

class _RootDetectionAppState extends ConsumerState<RootDetectionApp> {
  @override
  void initState() {
    super.initState();
    // Perform root check on app start
    ref.read(rootDetectionProvider.notifier).checkRootStatus().then((_) {
      final rootState = ref.read(rootDetectionProvider);
      if (!rootState.rootedCheck) {
        Navigator.of(context).pushReplacementNamed(SearchScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RootDetectionScreen(),
    );
  }
}
