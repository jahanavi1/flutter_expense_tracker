import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/chart/chart.dart';
import 'package:flutter_expense_tracker/widgets/expenses_list.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Flutter Course',
        category: Category.food,
        amount: 19.99,
        dateTime: DateTime.now()),
    Expense(
        title: 'Cinema',
        category: Category.work,
        amount: 15.99,
        dateTime: DateTime.now()),
    Expense(
        title: 'Fl',
        category: Category.leisure,
        amount: 13.99,
        dateTime: DateTime.now()),
    Expense(
        title: 'Flutter Course',
        category: Category.travel,
        amount: 12.99,
        dateTime: DateTime.now()),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted.'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpense.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    var width = MediaQuery.of(context).size.width;

    Widget mainContent =
        const Center(child: Text('No Expense found. start adding some!'));

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenseList: _registeredExpense,
        onRemovedExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                // Toolbar
                Chart(expenses: _registeredExpense),
                Expanded(
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                Expanded(child:  Chart(expenses: _registeredExpense),),
                Expanded(
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
