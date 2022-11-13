import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally/providers/players.dart';
import 'package:tally/screens/history_screen.dart';
import 'package:tally/screens/home_screen.dart';

void main() {
  runApp(TallyApp());
}

class TallyApp extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Players()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tally',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          HistoryScreen.routeName: (ctx) => const HistoryScreen(),
        },
      ),
    );
  }
}
