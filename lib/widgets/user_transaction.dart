import 'package:flutter/material.dart';
import 'package:training_flutter_widgets_project/models/transaction.dart';
import 'package:training_flutter_widgets_project/widgets/transaction_list.dart';

class UserTransaction extends StatelessWidget {
  final List<Transaction> transactions;
  Function(String) deleteTransaction;

  UserTransaction(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TranscationList(
            transactions: transactions, deleteTransaction: deleteTransaction),
      ],
    );
  }
}
