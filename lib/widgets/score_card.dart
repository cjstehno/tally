import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally/dialogs/remove_player_confirm_dialog.dart';
import 'package:tally/dialogs/update_score_dialog.dart';
import 'package:tally/models/player.dart';
import 'package:tally/providers/players.dart';

class ScoreCard extends StatelessWidget {
  final Player player;

  const ScoreCard({super.key, required this.player});

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (ctx) => UpdateScoreDialog(player.name, player.score),
        ).then((newScore) {
          if (newScore != null) {
            context.read<Players>().updateScore(player.name, newScore);
          }
        }),
        onDoubleTap: () => showDialog(
          context: context,
          builder: (ctx) => RemovePlayerConfirmDialog(player.name),
        ).then((confirmed) {
          if (confirmed) {
            context.read<Players>().remove(player.name);
          }
        }),
        child: Card(
          elevation: 10,
          color: Colors.amberAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                player.score.toString(),
                style: const TextStyle(
                  fontSize: 64.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                player.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
