class EventRequestModel {
  String venue = "";
  String ids = "";
  String type = "";
  String city = "";
  int eDate = 0;
  int page = 0;
  String keywords = "";
  int sDate = 0;
  String category = "";
  String cityDisplay = "";
  int rows = 0;

  EventRequestModel();

  EventRequestModel.fromJson(Map<String, dynamic> json) {
    venue = json['venue'] ?? "";
    ids = json['ids'] ?? "";
    type = json['type'] ?? "";
    city = json['city'] ?? "";
    eDate = json['edate'] ?? 0;
    page = json['page'] ?? 0;
    keywords = json['keywords'] ?? "";
    sDate = json['sdate'] ?? 0;
    category = json['category'] ?? "";
    cityDisplay = json['city_display'] ?? "";
    rows = json['rows'] ?? 0;
  }
}
