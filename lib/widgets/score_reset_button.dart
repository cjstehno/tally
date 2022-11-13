import 'package:flutter/material.dart';
import 'package:tally/dialogs/reset_score_confirm_dialog.dart';
import 'package:tally/providers/players.dart';

class ScoreResetButton extends StatelessWidget {
  final Players _players;

  const ScoreResetButton(this._players);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (ctx) => const ResetScoresConfirmDialog(),
      ).then((confirmed) {
        if (confirmed) {
          _players.resetScores();
        }
      }),
      icon: const Icon(Icons.clean_hands_outlined),
    );
  }
}
