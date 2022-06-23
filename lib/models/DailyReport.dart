class DailyReport {
  String asOfDate;
  String asOfTime;
  int numberOfConfirmedCases;
  int numberOfRuledOutCases;
  int numberOfCasesStillHospitalisedForInvestigation;
  int numberOfCasesFulfillingTheReportingCriteria;
  int numberOfDeathCases;
  int numberOfDischargeCases;
  int numberOfProbableCases;

  DailyReport(
      {this.asOfDate,
      this.asOfTime,
      this.numberOfConfirmedCases,
      this.numberOfRuledOutCases,
      this.numberOfCasesStillHospitalisedForInvestigation,
      this.numberOfCasesFulfillingTheReportingCriteria,
      this.numberOfDeathCases,
      this.numberOfDischargeCases,
      this.numberOfProbableCases});

  DailyReport.fromJson(Map<String, dynamic> json) {
    
    asOfDate = json['As of date'];
    asOfTime = json['As of time'];
    numberOfConfirmedCases = json['Number of confirmed cases'];
    numberOfRuledOutCases = json['Number of ruled out cases'];
    numberOfCasesStillHospitalisedForInvestigation =
        json['Number of cases still hospitalised for investigation'];
    numberOfCasesFulfillingTheReportingCriteria =
        json['Number of cases fulfilling the reporting criteria'];
    numberOfDeathCases = json['Number of death cases'];
    numberOfDischargeCases = json['Number of discharge cases'];
    numberOfProbableCases = json['Number of probable cases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['As of date'] = this.asOfDate;
    data['As of time'] = this.asOfTime;
    data['Number of confirmed cases'] = this.numberOfConfirmedCases;
    data['Number of ruled out cases'] = this.numberOfRuledOutCases;
    data['Number of cases still hospitalised for investigation'] =
        this.numberOfCasesStillHospitalisedForInvestigation;
    data['Number of cases fulfilling the reporting criteria'] =
        this.numberOfCasesFulfillingTheReportingCriteria;
    data['Number of death cases'] = this.numberOfDeathCases;
    data['Number of discharge cases'] = this.numberOfDischargeCases;
    data['Number of probable cases'] = this.numberOfProbableCases;
    return data;
  }
}