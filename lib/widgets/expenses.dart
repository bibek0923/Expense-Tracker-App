import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense_list.dart';
import 'package:flutter/material.dart';
import 'expense_list.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 1000,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Chywanparaash',
        amount: 600.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: ' UV glass',
        amount: 10000,
        date: DateTime.now(),
        category: Category.travel),
  ];
  void openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      //  enableDrag: true, //
      //dhherai properties hunchha showmodalbottom sheet ko its like a dialog box ..screen ma touch garda gayab hune type ko//
      context: context,
      builder: (ctx) {
        return NewExpense(
          onAddExpense: addExpense,
        );
      },
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //euta hatayepaxi arko hataune bitikkai previous message haraune
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
   // print(width);
    // print(height);
    Widget mainContent = const Center(
      child: Text("NO Expenses found . Try adding some "),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: openAddExpenseOverlay, icon: Icon(Icons.add))
        ],
      ),
      body: width < 600? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ) : Row(
         children: [
      Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
