import 'package:flutter/material.dart';
import 'package:trackerapp/widgets/expenses.dart';

void main() {

  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    )
  );
}
