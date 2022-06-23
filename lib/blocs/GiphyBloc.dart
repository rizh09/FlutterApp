import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:convid19/models/Giphy.dart';
import 'package:convid19/networking/Response.dart';
import 'package:convid19/repository/GiphyRepository.dart';
import 'package:convid19/view/GiphyScreen.dart';

class GiphyBloc implements Bloc{
  GiphyRepository _giphyRepository;
  StreamController _streamController;
  StreamSink<Response<Data>> get reportListSink => _streamController.sink;

  Stream<Response<Data>> get reportListStream => _streamController.stream;

  GiphyBloc() {
    _streamController = StreamController<Response<Data>>();
    _giphyRepository = GiphyRepository();
  }
  var _jsonList = List<Data>();

  fetchGifs(API_ACTION action, String keywords, int offset, int limit) async {
    try {
      var data = await _giphyRepository.fetchGifs(keywords, offset, limit);

      switch (action) {
        case API_ACTION.PULL:
          reportListSink.add(Response.loading('Fetching...'));
          _jsonList.clear();
          _jsonList = data;
          break;
        case API_ACTION.APPEND:
          _jsonList.addAll(data);
          break;
      }

      reportListSink.add(Response.completed(_jsonList));
    } catch (e) {
      reportListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _streamController?.close();
  }
}
