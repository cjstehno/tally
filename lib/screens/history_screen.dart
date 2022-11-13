import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally/providers/players.dart';
import 'package:tally/widgets/history_list.dart';
import 'package:tally/widgets/score_reset_button.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = '/history';

  const HistoryScreen();

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder(
      future: context.read<Players>().load(),
      builder: (ctx, snap) {
        final bool loaded = snap.connectionState == ConnectionState.done;
        final players = context.watch<Players>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Tally > Score History'),
            actions: [
              ScoreResetButton(players),
            ],
          ),
          body: loaded
              ? HistoryList(players)
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
