import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:tally/tally_home.dart';

void main(){
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.message}');
  });

  runApp(TallyApp());
}

class TallyApp extends StatelessWidget {

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tally',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TallyHome(),
    );
  }
}