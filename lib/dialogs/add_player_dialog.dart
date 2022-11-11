import 'package:flutter/material.dart';

class AddPlayerDialog extends StatefulWidget {
  const AddPlayerDialog();

  @override
  State<AddPlayerDialog> createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      title: const Text('Add a player'),
      content: TextField(
        autofocus: true,
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Player name'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
