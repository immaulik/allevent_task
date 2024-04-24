import 'package:allevents/modules/event_detail/event_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventDetail extends GetView<EventDetailController> {
  const EventDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.eventModel.value.eventName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
      ),
      body: WebViewWidget(controller: controller.webViewController),
    );
  }
}
