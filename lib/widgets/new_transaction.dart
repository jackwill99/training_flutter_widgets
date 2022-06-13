import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, double) addNewTransaction;
  NewTransaction({Key? key, required this.addNewTransaction}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addNewTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            OutlinedButton(
              onPressed: submitData,
              style: OutlinedButton.styleFrom(
                  primary: Colors.purple,
                  side: const BorderSide(color: Colors.purple)),
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
