import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime) addNewTransaction;

  const NewTransaction({Key? key, required this.addNewTransaction})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // form data
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty ||
        double.parse(enteredAmount) <= 0 ||
        selectedDate == null) {
      return;
    }

    // you can use parameters like that in this stateLessWidget from the stateFulWidget when passing named parameter in parent stateFullWidget class,
    widget.addNewTransaction(
        enteredTitle, double.parse(enteredAmount), selectedDate!);

    // this will close when have opened model
    Navigator.of(context).pop();
  }

  // showing date picker
  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value == null) {
          return;
        }
        setState(() => selectedDate = value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // When using column we need to add mainAxisSize: MainAxisSize.min to Column.
    // As we know that by default Column height is unbounded which means it takes as much height as it gets
    // i.e. Full Available height. So in order to prevent,
    // we set mainAxisSize to MainAxisSize.min which will take the required height by the child
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                hintText: "Title",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              controller: titleController,
              keyboardType: TextInputType.text,
            ),

            // this serves as break line
            const SizedBox(
              height: 12,
            ),

            TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                hintText: "Amount",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),

            // this serves as break line
            const SizedBox(
              height: 12,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  selectedDate == null
                      ? 'Choose Date'
                      : DateFormat.yMd().format(selectedDate!),
                  style: const TextStyle(fontSize: 18),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () {
                    presentDatePicker();
                  },
                  child: const Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),

            // this serves as break line
            const SizedBox(
              height: 12,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.blueAccent.shade400),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    primary: Colors.blueAccent[400],
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 28),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
                onPressed: submitData,
                child: const Text("Add Transaction"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
