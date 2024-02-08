import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenseList, required this.onRemovedExpense});

  final List<Expense> expenseList;
  final void Function(Expense expense) onRemovedExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenseList[index]),
          background: Container(color: Theme.of(context).colorScheme.error,
          margin: const EdgeInsets.symmetric(horizontal: 16),)
          ,onDismissed: (direction) {
            onRemovedExpense(expenseList[index]);
          }, child:  ExpenseItem(expenseList[index])),
    );
  }
}
