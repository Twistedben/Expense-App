import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx; 

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // HAving this exits the function is either are true siince we don't want to then execute addTx
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    // Allows access of properties and methods inside widget class to be used inside state class
    widget.addTx(
      enteredTitle, 
      enteredAmount,
    );

    // Closes modal after submitting data/new transaction. NAvigator pop closes the top most screen
      // Context is a special property available to give context of the widget
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              autofocus: true,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}