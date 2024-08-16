import 'package:flutter_riverpod/flutter_riverpod.dart';

class MediaViewModel extends StateNotifier<Set<String>> {
  MediaViewModel() : super({});

  List<String> mediaTypes = [
  'movie',
  'podcast',
  'music',
  'musicVideo',
  'audiobook',
  'shortFilm',
  'tvShow',
  'software',
  'ebook',
];

 Map<String, List<String>> mediaKindMap = {
  'movie': ['movieArtist', 'movie'],
  'podcast': ['podcastAuthor', 'podcast'],
  'music': ['musicArtist', 'musicTrack', 'album', 'musicVideo', 'mix', 'song'],
  'musicVideo': ['musicArtist', 'musicVideo'],
  'audiobook': ['audiobookAuthor', 'audiobook'],
  'shortFilm': ['shortFilmArtist', 'shortFilm'],
  'tvShow': ['tvEpisode', 'tvSeason'],
  'software': ['software', 'iPadSoftware', 'macSoftware'],
  'ebook': ['ebook'],
};

  void toggleSelection(String mediaType) {
    if (state.contains(mediaType)) {
      state = {...state}..remove(mediaType);
    } else {
      state = {...state}..add(mediaType);
    }
  }
}

final mediaViewModelProvider = StateNotifierProvider<MediaViewModel, Set<String>>(
  (ref) => MediaViewModel(),
);
