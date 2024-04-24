import 'package:allevents/models/ticket_model.dart';
import 'package:allevents/models/venue_model.dart';

class EventModel {
  String eventId = "";
  String eventName = "";
  String eventNameRaw = "";
  String ownerId = "";
  String thumbUrl = "";
  String thumbUrlLarge = "";
  DateTime startTime = DateTime(0);
  String startTimeDisplay = "";
  DateTime endTime = DateTime(0);
  String endTimeDisplay = "";
  String location = "";
  VenueModel venue = VenueModel();
  String label = "";
  int featured = 0;
  String eventUrl = "";
  String shareUrl = "";
  String bannerUrl = "";
  double score = 0.0;
  List<String> categories = <String>[];
  List<String> tags = <String>[];
  TicketsModel tickets = TicketsModel();
  List<String> customParams = <String>[];

  EventModel();

  EventModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'] ?? "";
    eventName = json['eventname'] ?? "";
    eventNameRaw = json['eventname_raw'] ?? "";
    ownerId = json['owner_id'] ?? "";
    thumbUrl = json['thumb_url'] ?? "";
    thumbUrlLarge = json['thumb_url_large'] ?? "";
    startTime = json['start_time'] != null
        ? DateTime.fromMillisecondsSinceEpoch(json['start_time'] * 1000)
        : DateTime(0);
    startTimeDisplay = json['start_time_display'] ?? "";
    endTime = json['end_time'] != null
        ? DateTime.fromMillisecondsSinceEpoch(json['end_time'] * 1000)
        : DateTime(0);
    endTimeDisplay = json['end_time_display'] ?? "";
    location = json['location'] ?? "";
    venue = json['venue'] != null
        ? VenueModel.fromJson(json['venue'])
        : VenueModel();
    label = json['label'] ?? "";
    featured = json['featured'] ?? "";
    eventUrl = json['event_url'] ?? "";
    shareUrl = json['share_url'] ?? "";
    bannerUrl = json['banner_url'] ?? "";
    score = json['score'].toDouble() ?? 0.0;
    categories =
        json['categories'] != null ? json['categories'].cast<String>() : [];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    tickets = json['tickets'] != null
        ? TicketsModel.fromJson(json['tickets'])
        : TicketsModel();
    customParams = json['custom_params'] != null
        ? json['custom_params'].cast<String>()
        : [];
  }
}
