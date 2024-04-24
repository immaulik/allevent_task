import 'package:allevents/models/event_model.dart';
import 'package:allevents/models/event_request_model.dart';

class EventResponseModel {
  EventRequestModel request = EventRequestModel();
  int count = 0;
  List<EventModel> events = <EventModel>[];

  EventResponseModel();

  EventResponseModel.fromJson(Map<String, dynamic> json) {
    request = json['request'] != null
        ? EventRequestModel.fromJson(json['request'])
        : EventRequestModel();
    count = json['count'] ?? "";

    events = ((json["item"] ?? []) as List<dynamic>)
        .map((e) => EventModel.fromJson(e))
        .toList();
  }
}
