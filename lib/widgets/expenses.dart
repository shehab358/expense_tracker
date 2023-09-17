import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

void _openAddExpenseOverlay(){
  showModalBottomSheet(
    isScrollControlled: true ,
    context: context,
     builder: (ctx) => NewExpense(onAddExpense: _addExpense)
    );
}

void _addExpense(Expense expense){
  setState(() {
  _registeredExpenses.add(expense);

  });
}

void _removeExpense(Expense expense){
  final expenseIndex = _registeredExpenses.indexOf(expense);
setState(() {
  _registeredExpenses.remove(expense);
});
ScaffoldMessenger.of(context).removeCurrentSnackBar();
ScaffoldMessenger.of(context).showSnackBar(
   SnackBar(
    duration: const Duration(seconds: 3),
    content: const Text(
      'Expense Deleted'
      ),
      action: SnackBarAction(
        label: 'UNDO',
         onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
         }),
      ));
}


final List<Expense> _registeredExpenses = [
  Expense(
    title: 'Lunch',
     amount: 18.85, 
     date: DateTime.now(),
      category: Category.food
      ),
      Expense(
    title: 'Work',
     amount: 20.85, 
     date: DateTime.now(),
      category: Category.work
      ),
];
  

  @override
  Widget build(BuildContext context) {

    Widget mainContent = const Center(
      child: Text(
      'No Expenses Found. Start Adding Some!!'
      )
      );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
              );
    }

    return  Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 60,
          child: FloatingActionButton(
            onPressed: 
              _openAddExpenseOverlay
            ,
            child:  const Icon(Icons.add,
            size: 30,    
            ),
            ),
        ),
      )
         
,
      appBar: AppBar(
        
        title: const Text ('Expense Tracker'),
      ),
      body: Column(
        children: [
            Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent
          )
        ],
      ),
    );
  }
}