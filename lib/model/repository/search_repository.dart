import 'package:m2p_assignment/model/service/base_service.dart';
import 'package:m2p_assignment/model/service/search_service.dart';
import '../data_model/media_model/media_model.dart';

class SearchMediaRepository {
  final BaseService _mediaService = SearchService();

  Future<Media> fetchMediaList(String value) async {
    dynamic response = await _mediaService.getResponse(value);
    final jsonData = response;
    Media mediaList = Media.fromJson(jsonData);
    return mediaList;
  }
}
