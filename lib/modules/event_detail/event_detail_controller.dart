import 'package:allevents/models/event_model.dart';
import 'package:allevents/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventDetailController extends GetxController {
  Rx<EventModel> eventModel = EventModel().obs;
  WebViewController webViewController = WebViewController();

  @override
  void onInit() {
    eventModel.value = Get.arguments;
    _initializeWebView();
    super.onInit();
  }

  void _initializeWebView() {
    logger.w(eventModel.value.eventUrl);
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color( 0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse(eventModel.value.eventUrl));
  }
}
