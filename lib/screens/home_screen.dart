import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally/dialogs/add_player_dialog.dart';
import 'package:tally/models/player.dart';
import 'package:tally/providers/players.dart';
import 'package:tally/screens/history_screen.dart';
import 'package:tally/widgets/player_grid.dart';
import 'package:tally/widgets/score_reset_button.dart';

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
                onPressed: () => Navigator.pushNamed(context, HistoryScreen.routeName),
                icon: const Icon(Icons.history),
              ),
              ScoreResetButton(context.read<Players>()),
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
