import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// for formatted date 
final formatter = DateFormat.yMd();

// this is generate uniq id 
const uuid = Uuid();

enum Category { food, travel, leisure, work }
// use icon each category 
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {

  Expense({
    required this.title,
    required this.anount,
    required this.date,
    required this.category,
  }): id = uuid.v4();

  final String id; //  1, 2, 3
  final String title;
  final double anount;
  final DateTime date;
  final Category category;


  String get formattedDate {
    return formatter.format(date);
  }

}