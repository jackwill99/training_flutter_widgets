import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
/*
this class file is not a widget. It's just a class. So required can't used in this class.
It supports in widget.
-----------
here it is, i use named arguments. learn named arguments Vs positional arguments
 */
