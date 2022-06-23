 import '../networking/ApiProvider.dart';
import 'dart:async';
import '../models/Giphy.dart';

class GiphyRepository {
  ApiProvider _provider = ApiProvider();


  Future<List<Data>> fetchGifs(String keywords, int offset, int limit) async {
    var jsonData = await _provider.getGifs(keywords, offset, limit);
    Giphy giphy = Giphy.fromJson(jsonData);
    return giphy.data.toList();
  }

  Future<List<Data>> fetchTrendGifs(int offset, int limit) async {
    var jsonData = await _provider.getTrendGifs(offset, limit);
    Giphy giphy = Giphy.fromJson(jsonData);
    return giphy.data.toList();
  }
}
