import 'CustomException.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  static String giphyAPIkey = "api_key=<get your own giphyAPIkey>";
  static String gifHost = "https://api.giphy.com";
  static String searchPath = "/v1/gifs/search?" + giphyAPIkey;
  static String trendingPath = "/v1/gifs/trending?" + giphyAPIkey;

  final String _url =
      "https://api.data.gov.hk/v2/filter?q=%7B%22resource%22%3A%22http%3A%2F%2Fwww.chp.gov.hk%2Ffiles%2Fmisc%2Flatest_situation_of_reported_cases_wuhan_eng.csv%22%2C%22section%22%3A1%2C%22format%22%3A%22json%22%7D";
  Future<dynamic> getTrendGifs(int offset, int limit) async {
    var reponseJson;
    try {
      String gifyPath = gifHost +
          trendingPath +
          "&offset=" +
          offset.toString() +
          "&limit=" +
          limit.toString();
      print(gifyPath);
      final response = await http.get(gifyPath);
      reponseJson = json.decode(response.body.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return reponseJson;
  }

  Future<dynamic> getGifs(String keywords, int offset, int limit) async {
    var reponseJson;
    try {
      String gifyPath = gifHost +
          searchPath +
          "&q=" +
          keywords +
          "&offset=" +
          offset.toString() +
          "&limit=" +
          limit.toString();
      print(gifyPath);
      final response = await http.get(gifyPath);
      reponseJson = json.decode(response.body.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return reponseJson;
  }

  Future<dynamic> get() async {
    var responseJson;
    try {
      final response = await http.get(_url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
