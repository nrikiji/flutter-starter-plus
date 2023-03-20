import 'package:flutter/material.dart';

import '../localize.dart';

class MessageDialog extends StatelessWidget {
  final String content;
  const MessageDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).labelMessage),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(AppLocalizations.of(context).labelOk),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
