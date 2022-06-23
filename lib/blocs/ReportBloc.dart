import 'dart:async';

import 'package:convid19/models/DailyReport.dart';
import 'package:convid19/networking/Response.dart';
import 'package:convid19/repository/DailyReportRepository.dart';

class ReportBloc {
  DailyReportRepository _reportRepository;
  StreamController _streamController;
  StreamSink<Response<DailyReport>>  get reportListSink =>
      _streamController.sink;

  Stream<Response<DailyReport>> get reportListStream => 
  _streamController.stream;

  ReportBloc() {
    _streamController = StreamController<Response<DailyReport>>();
    _reportRepository = DailyReportRepository();
    fetchReport();
  }

  fetchReport() async {
    reportListSink.add(Response.loading('Getting Chuck Categories.'));
    try {
      List<DailyReport> reports = await _reportRepository.fetchReportData();
      reportListSink.add(Response.completed(reports));
    } catch (e) {
      reportListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _streamController?.close();
  }
}
