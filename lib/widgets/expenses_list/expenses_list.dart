import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense, });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index)=> Dismissible
      (
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: const EdgeInsets.symmetric(horizontal: 16 ),
        ),
        key: ValueKey(expenses[index]) ,
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        } ,
        child: ExpenseItem(expenses[index])
        )

      ,itemCount: expenses.length,
     
    )
    ;
  }
}