//import 'dart:js';
//import 'dart:js_interop';

//import 'dart:js_interop';

//import 'dart:js_interop';

import 'dart:io';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

//String enteredValue = '';

class _NewExpenseState extends State<NewExpense> {
  /* void saveTitleInput(String inputValue) {
    enteredValue = inputValue;
  }
*/
  final titleController =
      TextEditingController(); //yo use garepaxi dispose pani use garnu parxa and it is used in stateful widgets so be careful..dispose use garnu ko reason is if the eidget is not used esle memory lirakhdaina
  final amountController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  Category selectedCAtegory = Category.leisure;
  DateTime? selectedDate;
  void showDate() async {
    final now = DateTime.now();
    final firstDatee = DateTime(now.year - 10, now.month, now.day);

    final pickeddate = await showDatePicker(
        helpText: '2011/05/4',
        //currentDate: DateTime.now(),
        context: context,
        initialDate: now,
        firstDate: firstDatee,
        lastDate: now);
    // print(pickeddate);
    setState(() {
      selectedDate = pickeddate;
    });
    //selectedDate = pickeddate;
  }

  void submitExpense() {
    final enteredAmount = double.tryParse(amountController.text);
    // print(enteredAmount);
    bool isamountvalid = enteredAmount == null || enteredAmount <= 0;
    if (titleController.text.trim().isEmpty ||
        isamountvalid ||
        selectedDate == null) {
      // print('error');
      if (Platform.isIOS) {
        //for  adaptive  widgets..if ios simulator vako vhaye aile arko ios style dialogue box appear hunthyo
        showCupertinoDialog(
            context: context,
            builder: (ctx) {
              return CupertinoAlertDialog(
                title: Text('Invalid input'),
                content: Text('Please enter the valid date , amount and title'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text('Exit'))
                ],
              );
            });
      } else
        showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text('Invalid input'),
                content: Text('Please enter the valid date , amount and title'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text('Exit'))
                ],
              );
            });
      return;
    }
    widget.onAddExpense(
      Expense(
          title: titleController.text,
          amount: enteredAmount,
          date: selectedDate!,
          category: selectedCAtegory),
    );
    Navigator.pop(context);
  }

  /*void fff(Expense expense){
  Expense(title: titleController.text, amount:  , date: selectedDate!, category: selectedCAtegory);
 }*/
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      return SizedBox(
        // width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              keyboardSpace + 16,
            ),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          //there are many features of textfield..
                          controller:
                              titleController, //multiple text field vayesi multiple controller use garxam
                          // onChanged: saveTitleInput, esko arkoo approach bhaneko texteditorcontroll class walaa ho, better ni hunchha//
                          decoration: const InputDecoration(
                            hintText: 'enter your title',
                            hoverColor: Colors.amber,
                            contentPadding: EdgeInsets.all(5),
                            label: Text('Title'),
                          ),
                          maxLength: 50,
                          // obscureText: true, // pw haru hanesi text hide vayera ** aune feature ho yo
                          // obscuringCharacter: '*',
                          // controller: ,//
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: amountController,
                          maxLength: 20,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Amount'),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    //there are many features of textfield..
                    controller:
                        titleController, //multiple text field vayesi multiple controller use garxam
                    // onChanged: saveTitleInput, esko arkoo approach bhaneko texteditorcontroll class walaa ho, better ni hunchha//
                    decoration: const InputDecoration(
                      hintText: 'enter your title',
                      hoverColor: Colors.amber,
                      contentPadding: EdgeInsets.all(5),
                      label: Text('Title'),
                    ),
                    maxLength: 50,
                    // obscureText: true, // pw haru hanesi text hide vayera ** aune feature ho yo
                    // obscuringCharacter: '*',
                    // controller: ,//
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                          value: selectedCAtegory,
                          //  hint: Text(),
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category.name.toString().toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              selectedCAtegory = value;
                            });
                          }),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(selectedDate == null
                                ? 'no dates selected'
                                : formatter.format(selectedDate!)),
                            IconButton(
                                onPressed: showDate,
                                icon: Icon(Icons.calendar_month)),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: amountController,
                          maxLength: 20,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Amount'),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(selectedDate == null
                                ? 'no dates selected'
                                : formatter.format(selectedDate!)),
                            IconButton(
                                onPressed: showDate,
                                icon: Icon(Icons.calendar_month)),
                          ],
                        ),
                      )
                    ],
                  ),
                SizedBox(
                  height: 15,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          /* print(titleController);
                      print(amountController);*/
                          submitExpense();
                        },
                        child: Text('Save Expense '),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.cancel_presentation_rounded),
                        label: Text(
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black),
                            'Cancel'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                          value: selectedCAtegory,
                          //  hint: Text(),
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category.name.toString().toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              selectedCAtegory = value;
                            });
                          }),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          /* print(titleController);
                      print(amountController);*/
                          submitExpense();
                        },
                        child: Text('Save Expense '),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.cancel_presentation_rounded),
                        label: Text(
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black),
                            'Cancel'),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
