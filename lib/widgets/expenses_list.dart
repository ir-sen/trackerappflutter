import 'package:flutter/material.dart';
import 'package:trackerapp/models/expense.dart';

import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  // this class get list 
  const ExpensesList({super.key, required this.expenses,});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // build lisetView create only when we create or use this class and we don't know how big this list to be
    return ListView.builder(itemCount: expenses.length, itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),);
  }

}