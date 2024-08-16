import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';
import 'package:m2p_assignment/view/search_result/search_result_screen.dart';
import 'package:m2p_assignment/view_model/search_view_model.dart';

import '../../../view_model/query_view_model.dart';

class SearchField extends ConsumerStatefulWidget {
  const SearchField({super.key});

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  late TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchViewModel = ref.watch(searchViewModelProvider.notifier);

    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {
          ref.read(queryProvider.notifier).state = value;
        },
        style: TextStyle(color: context.resources.color.secondaryColor),
        decoration: InputDecoration(
          hintText: 'Search...',
          filled: true,
          fillColor: context.resources.color.textFieldColor,
          hintStyle: TextStyle(
            color: context.resources.color.secondaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        textInputAction: TextInputAction.search,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter a search query';
          }
          return null;
        },
        onFieldSubmitted: (query) {
          if (_formKey.currentState?.validate() ?? false) {
            searchViewModel.fetchMedia(query).then((value) {
              Navigator.of(context).pushNamed(SearchResultScreen.id);
            },);
          }
        },
      ),
    );
  }
}
