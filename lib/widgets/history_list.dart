import 'package:flutter/material.dart';
import 'package:tally/providers/players.dart';
import 'package:tally/widgets/no_data.dart';

class HistoryList extends StatelessWidget {
  final Players _players;

  const HistoryList(this._players);

  @override
  Widget build(BuildContext context) {
    final history = _players.history.reversed.toList();

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightBlueAccent.shade100,
      child: history.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: history.length,
              itemBuilder: (ctx, index) {
                return Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 25,),
                  child: Text(
                    history[index],
                    style: const TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                );
              },
            )
          : const NoData('No history.'),
    );
  }
}
