import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally/dialogs/add_player_dialog.dart';
import 'package:tally/dialogs/reset_score_confirm_dialog.dart';
import 'package:tally/models/player.dart';
import 'package:tally/providers/players.dart';
import 'package:tally/widgets/player_grid.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder(
      future: context.read<Players>().load(),
      builder: (ctx, snap) {
        final bool loaded = snap.connectionState == ConnectionState.done;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Tally'),
            actions: [
              IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => const ResetScoresConfirmDialog(),
                ).then((confirmed) {
                  if (confirmed) {
                    context.read<Players>().resetScores();
                  }
                }),
                icon: const Icon(
                  Icons.lock_reset,
                ),
              ),
            ],
          ),
          body: loaded
              ? PlayerGrid()
              : const Center(child: CircularProgressIndicator()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => const AddPlayerDialog(),
              ).then((value) {
                if (value != null) {
                  context.read<Players>().add(Player(value, 0));
                }
              });
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
