import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally/providers/players.dart';
import 'package:tally/widgets/score_card.dart';

class PlayerGrid extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final players = context.watch<Players>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightBlueAccent.shade100,
      child: players.players.isNotEmpty
          ? GridView.count(
              crossAxisCount: 2,
              children:
                  players.players.map((p) => ScoreCard(player: p)).toList(),
            )
          : const Center(
              child: Text(
              'No players.',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 32.0,
                fontStyle: FontStyle.italic,
              ),
            )),
    );
  }
}
