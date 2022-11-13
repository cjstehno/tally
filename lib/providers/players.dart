// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tally/models/player.dart';

class Players with ChangeNotifier {
  static const String storageKey = 'tally';
  static const String playersKey = 'players';
  static const String historyKey = 'history';

  // FIXME: could use some refactoring

  final storage = LocalStorage(storageKey);
  final List<Player> _players = [];
  final List<String> _history = [];
  bool _loaded = false;

  /// Load the player data from the local storage.
  Future<void> load() async {
    if (!_loaded) {
      _players.clear();
      _history.clear();

      await storage.ready;

      await storage.getItem(historyKey).forEach((ent) {
        _history.add(ent);
      });
      print('Loaded ${_history.length} history items.');

      await storage.getItem(playersKey).forEach((pName, pScore) {
        _players.add(Player(pName, pScore));
      });
      print('Loaded ${_players.length} players.');

      _loaded = true;
    }
  }

  List<Player> get players {
    return _players;
  }

  List<String> get history {
    return _history;
  }

  /// Adds a new player to the storage.
  Future<void> add(final Player player) async {
    final Map<String, dynamic> playerData = storage.getItem(playersKey) ?? {};
    playerData[player.name] = player.score;
    await storage.setItem(playersKey, playerData);

    _players.add(player);

    print('Added $player');
    notifyListeners();
  }

  /// Removes the player with the given name from the storage.
  Future<void> remove(final String playerName) async {
    final Map<String, dynamic> playerData = storage.getItem(playersKey) ?? {};
    if (playerData.isNotEmpty) {
      playerData.remove(playerName);
      storage.setItem(playersKey, playerData);
    }

    _players.removeWhere((p) => p.name == playerName);

    print('Removed player $playerName');
    notifyListeners();
  }

  /// Updates the score for the player with the given name.
  Future<void> updateScore(final String playerName, final int newScore) async {
    // update the stored score
    final Map<String, dynamic> playerData = storage.getItem(playersKey) ?? {};
    final int oldScore = playerData[playerName] ?? 0;
    playerData[playerName] = newScore;
    await storage.setItem(playersKey, playerData);

    final scoreChange = newScore - oldScore;
    final changeValue = '${scoreChange > 0 ? '+' : ''}$scoreChange';
    final historyEntry = '$playerName $changeValue';

    // update the history
    final List<dynamic> history = storage.getItem(historyKey) ?? [];
    history.add(historyEntry);
    await storage.setItem(historyKey, history);

    // update the local values

    final player = _players.where((p) => p.name == playerName).first;
    player.score = newScore;
    print('Updated score for $playerName to $newScore ($changeValue)');

    _history.add(historyEntry);

    notifyListeners();
  }

  Future<void> resetScores() async {
    // reset the stored scores
    final Map<String, dynamic> playerData = storage.getItem(playersKey) ?? {};
    playerData.forEach((pName, pScore) {
      playerData[pName] = 0;
    });
    await storage.setItem(playersKey, playerData);

    // reset the stored history
    final List<dynamic> history = storage.getItem(historyKey) ?? [];
    history.clear();
    await storage.setItem(historyKey, history);

    _players.forEach((p) => p.score = 0);
    _history.clear();

    print('All scores reset to zero.');
    notifyListeners();
  }
}
