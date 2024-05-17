import 'package:flutter/material.dart';
import 'package:trackerapp/new_expense.dart';
import 'package:trackerapp/widgets/expenses_list.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {

  const Expenses({super.key});

  @override
  /// Creates the mutable state for this widget at a given location in the tree.
  ///
  /// Subclasses should override this method to return a newly created
  /// instance of their associated [State] subclass.
  ///
  /// The framework will call this method when it is time to create a
  /// [State] object for this [Widget]. The framework does this by calling
  /// [mount] on the widget that is about to be added to the tree, which calls
  /// the [createState] method to create the [State].
  ///
  /// In typical usage, the [State] instance returned by this method will
  /// not be the same as the [State] instance returned by subsequent
  /// [createState] calls for the same [Widget]. A new instance of the
  /// [State] class is typically created for each new location in the tree.
  ///
  /// The current configuration is passed to the [createState] method. The
  /// widget will be configured with the default values of the associated
  /// [State] class. The [createState] method is called before the
  /// [initState] method of the new [State] instance.
  @override
  State<Expenses> createState() {
    // Create and return a new instance of the private _ExpensesState class
    // which is defined below.
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  /// List of expenses to show in the widget
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      anount: 19.99,
      date: DateTime.now(),
      category: Category.work,
      ),

      Expense(
      title: 'Cinema',
      anount: 15.39,
      date: DateTime.now(),
      category: Category.leisure,
      ),
  ];

  void _openAddExpenseOverlay() {
    // ... 
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
      );
  }


  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            ),
        ],
      ),
      body: Column(
        // The widgets to show inside the Expenses widget
        children:  [
          const Text('The chart loll'),
          Expanded(
            // Expanded to take all the available space in the Expenses widget
            child: ExpensesList(expenses: _registeredExpenses),
          ) 
        ],
      ),
    );
  }
}


  /// Creates a widget that expands a child of a [Row], [Column], or [Flex]
  /// so that the child fills the available space along the flex widget's
  /// main axis.