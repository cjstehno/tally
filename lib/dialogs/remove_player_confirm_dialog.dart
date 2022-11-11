import 'package:flutter/material.dart';

class RemovePlayerConfirmDialog extends StatelessWidget {
  final String playerName;

  const RemovePlayerConfirmDialog(this.playerName);

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: Text('Do you want to remove $playerName?'),
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
