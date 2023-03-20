import 'package:flutter/material.dart';
import 'package:flutter_start_app/enum/review_status.dart';

import '../localize.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        AppLocalizations.of(context).messageReview,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      children: [
        SimpleDialogOption(
          child: Text(
            AppLocalizations.of(context).labelReviewOk,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onPressed: () => Navigator.pop(context, ReviewStatus.ok),
        ),
        SimpleDialogOption(
          child: Text(
            AppLocalizations.of(context).labelReviewCancel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onPressed: () => Navigator.pop(context, ReviewStatus.cancel),
        ),
        SimpleDialogOption(
          child: Text(
            AppLocalizations.of(context).labelReviewDeny,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onPressed: () => Navigator.pop(context, ReviewStatus.deny),
        ),
      ],
    );
  }
}
