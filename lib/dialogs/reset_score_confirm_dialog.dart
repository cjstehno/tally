import 'package:flutter/material.dart';

class ResetScoresConfirmDialog extends StatelessWidget {
  const ResetScoresConfirmDialog();

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('This will reset all of the scores to zero.'),
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
