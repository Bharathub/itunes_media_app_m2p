import 'package:flutter/material.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';
import 'package:m2p_assignment/view/search/widgets/paramter_selector.dart';

import '../../res/Resources.dart';
import '../shared/text_view.dart';
import 'widgets/search_field.dart';
import 'widgets/submit_button.dart';

class SearchScreen extends StatelessWidget {
  static const String id = "search_screen";
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resources = context.resources;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    
    return Scaffold(
      backgroundColor: resources.color.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeaderRow(resources, screenWidth),
                SizedBox(height: screenHeight * 0.08), // 8% of screen height
                _buildDescriptionText(resources, screenWidth),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                const SearchField(),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                _buildParameterText(resources, screenWidth),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                const ParameterSelector(),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                SubmitButton(resources: resources),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow(Resources resources, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.apple,
          color: resources.color.secondaryColor,
          size: screenWidth * 0.1, // 10% of screen width
        ),
        const MyTextView(
          label: "iTunes",
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Widget _buildDescriptionText(Resources resources, double screenWidth) {
    return MyTextView(
      label:
          "Search for a variety of content from the iTunes store including iBooks, movies, podcasts, music, music videos, and audiobooks.",
      fontSize: screenWidth * 0.05, // 5% of screen width
      fontWeight: FontWeight.bold,
    );
  }

  Widget _buildParameterText(Resources resources, double screenWidth) {
    return MyTextView(
      label: "Specify the parameter for the content to be searched",
      fontSize: screenWidth * 0.04, // 4% of screen width
      fontWeight: FontWeight.bold,
    );
  }
}
