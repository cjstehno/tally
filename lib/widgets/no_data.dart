import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String _label;

  const NoData(this._label);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _label,
        style: const TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 32.0,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
