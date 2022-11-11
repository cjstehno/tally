import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:tally/player.dart';
import 'package:tally/score_card.dart';

class TallyHome extends StatelessWidget {
  final log = Logger('TallyHome');

  TallyHome({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tally'),
        actions: [
          IconButton(
            onPressed: () {
              // FIXME: clear the scores
              log.warning('Clearing the scores.');
            },
            icon: const Icon(
              Icons.lock_reset,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlueAccent.shade100,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            ScoreCard(player: Player('Ariana', 42)),
            ScoreCard(player: Player('Christopher', 42)),
            ScoreCard(player: Player('Ariana', 100)),
            ScoreCard(player: Player('Bob', 42)),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
