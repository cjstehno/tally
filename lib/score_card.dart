import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:tally/player.dart';

class ScoreCard extends StatelessWidget {
  final log = Logger('TallyHome');
  final Player player;

  ScoreCard({super.key, required this.player});

  @override
  Widget build(final BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // FIXME: open score editor
          log.warning('Opening score editor.');
        },
        onDoubleTap: (){
          // FIXME: open player editor
          log.warning('Confirming player delete.');
        },
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
