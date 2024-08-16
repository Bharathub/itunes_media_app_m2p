import 'dart:convert';
import 'dart:io';
import 'package:m2p_assignment/model/app_exception.dart';
import 'package:m2p_assignment/model/service/base_service.dart';
import 'package:m2p_assignment/model/service/http_client.dart';

class SearchService extends BaseService {
  final CustomHttpClient _client = CustomHttpClient();

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final request = await _client.getUrl(Uri.parse(mediaBaseUrl + url));
      final response = await request.close(); // This returns HttpClientResponse
      responseJson = await _parseResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> _parseResponse(HttpClientResponse response) async {
    final responseBody = await response.transform(utf8.decoder).join();
    switch (response.statusCode) {
      case 200:
        return jsonDecode(responseBody);
      case 400:
        throw BadRequestException(responseBody.toString());
      case 401:
      case 403:
        throw UnauthorisedException(responseBody.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with server'
            ' with status code : ${response.statusCode}');
    }
  }
}
