import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transaction.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Clothes',
      amount: 16.78,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Text('chart'),
              ),
            ),
            const Card(
              color: Colors.orange,
              child: Text('test'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // map return Iterable widget and transform to list with .toList() method and it goes list
              // u can also use like this
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.purple, width: 2),
                      ),
                      child: Text(
                        '\$ ${tx.amount}',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          // intl data format
                          // DateFormat("dd-MMMM-yyyy").format(tx.date),
                          DateFormat.yMMMd().format(tx.date),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
              }).toList(),
            ),
          ],
        ));
  }
}
