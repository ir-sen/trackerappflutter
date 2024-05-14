import 'package:flutter/material.dart';
import 'package:trackerapp/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  // get objext expense 
  const ExpenseItem(this.expense, {super.key});
  
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        // just put padding and setting this 
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4,),
            Row (
              children: [
                Text('\$${expense.anount.toStringAsFixed(2)} '),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    Text(expense.formattedDate),
                  ],
                ),
                // 12.3445 => 12.34 show only first 2 number after float
              ],
            )
          ],
        ),
      )
      );
  }
}