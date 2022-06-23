import '../networking/ApiProvider.dart';
import 'dart:async';
import '../models/DailyReport.dart';

class DailyReportRepository {
  ApiProvider _provider = ApiProvider();

  Future<List<DailyReport>> fetchReportData() async {
    Iterable jsonData = await _provider.get();
    return jsonData.map((model) => DailyReport.fromJson(model)).toList();
  }
}
