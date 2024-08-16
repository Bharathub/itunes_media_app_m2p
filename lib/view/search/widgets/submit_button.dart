import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2p_assignment/res/Resources.dart';
import 'package:m2p_assignment/view/shared/text_view.dart';
import 'package:m2p_assignment/view_model/search_view_model.dart';

import '../../../view_model/query_view_model.dart';
import '../../search_result/search_result_screen.dart';

class SubmitButton extends ConsumerWidget {
  final Resources resources;

  const SubmitButton({super.key, required this.resources});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchViewModel = ref.watch(searchViewModelProvider.notifier);
    final searchState = ref.watch(searchViewModelProvider);
    final query = ref.watch(queryProvider);

    return SizedBox(
      width: double.maxFinite,
      height: resources.dimension.buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: resources.color.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: searchState.loading
            ? null
            : () => _handleSubmit(ref, searchViewModel, query, context),
        child: searchState.loading
            ? _buildLoadingIndicator()
            : const MyTextView(
                label: "Submit",
                fontWeight: FontWeight.bold,
              ),
      ),
    );
  }

  void _handleSubmit(WidgetRef ref, MediaSearchNotifier searchViewModel,
      String query, BuildContext context) {
    if (query.trim().isNotEmpty) {
      searchViewModel.fetchMedia(query).then(
        (value) {
          Navigator.of(context).pushNamed(SearchResultScreen.id);
        },
      );
    } else {
      ScaffoldMessenger.of(ref.context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a search query',
            style: TextStyle(color: Colors.white), // Text color
          ),
          backgroundColor: Colors.redAccent, // Background color
          behavior:
              SnackBarBehavior.floating, // Optional: make the SnackBar float
        ),
      );
    }
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      width: 24.0,
      height: 24.0,
      child: Stack(
        children: [
          const Positioned.fill(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          Center(
            child: SizedBox(
              width: 16.0,
              height: 16.0,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
