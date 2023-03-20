import 'package:flutter/material.dart';

import '../localize.dart';

class ConfirmDialog extends StatelessWidget {
  final String content;
  const ConfirmDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).labelConfirm),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(AppLocalizations.of(context).labelCancel),
          onPressed: () => Navigator.pop(context, false),
        ),
        TextButton(
          child: Text(AppLocalizations.of(context).labelOk),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
