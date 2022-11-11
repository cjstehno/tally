// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:tally/models/player.dart';

class Players with ChangeNotifier {
  final List<Player> _players = [];
  bool _loaded = false;

  /// Load the player data from the local storage.
  Future<void> load() async {
    if (!_loaded) {
      // FIXME: load from localstorage
      print('Loaded ${_players.length} players.');

      _loaded = true;
    }
  }

  List<Player> get players {
    return _players;
  }

  /// Adds a new player to the storage.
  Future<void> add(final Player player) async {
    // FIXME: add a player to local storage
    _players.add(player);
    print('Added $player');
    notifyListeners();
  }

  /// Removes the player with the given name from the storage.
  Future<void> remove(final String playerName) async {
    // fIXME: remove a player from local storage
    _players.removeWhere((p) => p.name == playerName);
    print('Removed player $playerName');
    notifyListeners();
  }

  /// Updates the score for the player with the given name.
  Future<void> updateScore(final String playerName, final int newScore) async {
    // FIXME: update score for player in local storage
    final player = _players.where((p) => p.name == playerName).first;
    player.score = newScore;
    print('Updated score for $playerName to $newScore');
    notifyListeners();
  }

  Future<void> resetScores() async {
    // FIXME: clear local storage
    _players.forEach((p) => p.score = 0);

    print('All scores reset to zero.');
    notifyListeners();
  }
}
