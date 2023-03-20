import 'package:flutter_start_app/localize.dart';

enum ReviewStatus {
  ok("ok"),
  cancel("cancel"),
  deny("deny");

  const ReviewStatus(this.value);
  final String value;
}

extension ReviewStatusExtension on ReviewStatus {
  static const _values = {
    "ok": ReviewStatus.ok,
    "cancel": ReviewStatus.cancel,
    "deny": ReviewStatus.deny,
  };

  static ReviewStatus fromString(String value) {
    return _values[value]!;
  }

  String i18n(LocalizeMessages messages) {
    switch (this) {
      case ReviewStatus.ok:
        return messages.labelReviewOk;
      case ReviewStatus.cancel:
        return messages.labelReviewCancel;
      case ReviewStatus.deny:
        return messages.labelReviewDeny;
    }
  }
}
