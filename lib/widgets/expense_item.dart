import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import './expenses.dart';


class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${expense.title.toString()}' , style: Theme.of(context).textTheme.titleMedium,),
            // SizedBox(height: ,),//
            Row(
              children: [
                //Text(expense.amount.toString()),//
                Text('\$ ${expense.amount.toStringAsFixed(3)}'),
                Spacer(),
               Icon(categoryIcons[expense.category])  ,
               // Spacer(),//
               SizedBox(width: 4,),
                Text(expense.formattedDate),
              ],
            )
          ],
        ),
      ),
    );
  }
}
