import 'package:flutter/material.dart';

class UpdateScoreDialog extends StatefulWidget {
  final String playerName;
  final int score;

  const UpdateScoreDialog(this.playerName, this.score);

  @override
  State<UpdateScoreDialog> createState() => _UpdateScoreDialogState();
}

class _UpdateScoreDialogState extends State<UpdateScoreDialog> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.score.toString();
    _controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: widget.score.toString().length,
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      title: Text('Update score for ${widget.playerName}'),
      content: TextField(
        autofocus: true,
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Player score'),
        onSubmitted: (value) => Navigator.pop(context, _resolveNewScore(value)),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pop(context, _resolveNewScore(_controller.text)),
          child: const Text('Ok'),
        ),
      ],
    );
  }

  int? _resolveNewScore(final String value) {
    // it should be
    // - a raw number treated as the value
    // - a "-N" string treated as CURRENT-N
    // - a "+N" string treated as CURRENT+N
    // TODO: would be nice to support expression (A+B, or A-B)

    // FIXME: refactoring
    if (value.contains('-') || value.contains("+")) {
      return widget.score + int.parse(value);
    } else {
      return int.tryParse(value);
    }
  }
}
