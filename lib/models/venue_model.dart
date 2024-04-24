class VenueModel {
  String street = "";
  String city = "";
  String state = "";
  String country = "";
  double latitude = 0.0;
  double longitude = 0.0;
  String fullAddress = "";

  VenueModel();

  VenueModel.fromJson(Map<String, dynamic> json) {
    street = json['street'] ?? "";
    city = json['city'] ?? "";
    state = json['state'] ?? "";
    country = json['country'] ?? "";
    latitude = json['latitude'].toDouble() ?? 0.0;
    longitude = json['longitude'].toDouble() ?? 0.0;
    fullAddress = json['full_address'] ?? "";
  }
}
