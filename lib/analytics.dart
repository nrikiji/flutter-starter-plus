import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static enable() {
    analytics.setAnalyticsCollectionEnabled(true);
  }

  static disable() {
    analytics.setAnalyticsCollectionEnabled(false);
  }

  static Future event(AnalyticsEventType eventType) async {
    final name = await _enumToString(eventType);
    await analytics.logEvent(name: name);
  }

  static Future _enumToString(eventType) async {
    return eventType.toString().split('.')[1];
  }
}

enum AnalyticsEventType {
  hello,
}
