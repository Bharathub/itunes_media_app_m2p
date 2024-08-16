import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';
import 'package:m2p_assignment/res/utils.dart';
import 'package:m2p_assignment/view/shared/text_view.dart';

import '../../view_model/media_selection_view_model.dart';

class MediaSelectionScreen extends ConsumerWidget {
  static const String id = "media_selection_screen";
  const MediaSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resources = context.resources;
    final mediaViewModel = ref.watch(mediaViewModelProvider);
    final mediaViewModelNotifier = ref.read(mediaViewModelProvider.notifier);

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final padding = mediaQuery.padding;
    
    return Scaffold(
      backgroundColor: resources.color.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: resources.color.secondaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: resources.color.primaryColor,
        title: MyTextView(
          label: 'Media',
          fontSize: screenWidth * 0.05, // 5% of screen width
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, // 4% of screen width
          vertical: screenHeight * 0.02, // 2% of screen height
        ),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: resources.color.chipsColor,
            thickness: 0.7,
            height: screenHeight * 0.02, // 2% of screen height
          ),
          itemCount: mediaViewModelNotifier.mediaTypes.length,
          itemBuilder: (context, index) {
            String mediaType = mediaViewModelNotifier.mediaTypes[index];
            bool isSelected = mediaViewModel.contains(mediaType);
            return ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.015, // 1.5% of screen height
                horizontal: screenWidth * 0.02, // 2% of screen width
              ),
              title: Text(
                AppUtils.capitalizeFirstLetter(mediaType),
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // 4.5% of screen width
                ),
              ),
              trailing: isSelected ? Icon(
                Icons.check,
                size: screenWidth * 0.05, // 5% of screen width
              ) : null,
              onTap: () {
                mediaViewModelNotifier.toggleSelection(mediaType);
              },
            );
          },
        ),
      ),
    );
  }
}
