import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2p_assignment/model/repository/search_repository.dart';
import 'package:m2p_assignment/model/data_model/search_state.dart';

import '../model/data_model/media_model/media_model.dart';

final searchMediaRepository = Provider<SearchMediaRepository>((ref) => SearchMediaRepository());

final searchViewModelProvider = StateNotifierProvider<MediaSearchNotifier, SearchState>((ref) {
  final repository = ref.watch(searchMediaRepository);
  return MediaSearchNotifier(repository);
});

class MediaSearchNotifier extends StateNotifier<SearchState> {
  final SearchMediaRepository _repository;

  MediaSearchNotifier(this._repository)
      : super(SearchState(mediaList: const AsyncValue.data([])));

  Future<void> fetchMedia(String query) async {
    state = state.copyWith(
      loading: true,
    );

    try {
      final Media mediaList = await _repository.fetchMediaList(query);
      state = state.copyWith(
        mediaList: AsyncValue.data(mediaList.results ?? []),
        loading: false,
      );
    } catch (e, stackTrace) {
      state = state.copyWith(
        mediaList: AsyncValue.error(e, stackTrace),
        loading: false,
      );
    }
  }
}

