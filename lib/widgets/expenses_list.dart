import 'package:flutter/material.dart';
import 'package:trackerapp/models/expense.dart';

import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  // this class get list 
  const ExpensesList(
    { 
      super.key,
      required this.expenses,
      required this.onRemoveExpense
    }

    );

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {

    

    // build lisetView create only when we create or use this class and we don't know how big this list to be
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        // if we swiping item we change color 
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75), //opacity faded bg
          margin: Theme.of(context).cardTheme.margin,
          ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
      );
  }

}