// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tally/models/player.dart';

class Players with ChangeNotifier {
  static const String storageKey = 'tally';
  static const String playersKey = 'players';

  final storage = LocalStorage(storageKey);
  final List<Player> _players = [];
  bool _loaded = false;

  /// Load the player data from the local storage.
  Future<void> load() async {
    if (!_loaded) {
      await storage.ready;

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
    final Map<String, dynamic> playerData = storage.getItem(playersKey) ?? {};
    playerData[playerName] = newScore;
    await storage.setItem(playersKey, playerData);

    final player = _players.where((p) => p.name == playerName).first;
    player.score = newScore;
    print('Updated score for $playerName to $newScore');
    notifyListeners();
  }

  Future<void> resetScores() async {
    final Map<String, dynamic> playerData = storage.getItem(playersKey) ?? {};
    playerData.forEach((pName, pScore) {
      playerData[pName] = 0;
    });
    await storage.setItem(playersKey, playerData);

    _players.forEach((p) => p.score = 0);

    print('All scores reset to zero.');
    notifyListeners();
  }
}
