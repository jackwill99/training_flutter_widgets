import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transaction> transactions;
  TranscationList({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          // ListView is same with Column but it has singlechildscrollview property
          // ListView.builder builds widgets as required (i.e when they can be seen) not holding more items list.
          // So it gets more performance
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: Text(
                    '\$ ${transactions[index].amount}',
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
                      transactions[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      // intl data format
                      // DateFormat("dd-MMMM-yyyy").format(tx.date),
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ));
          },
          itemCount: transactions.length,

          // map return Iterable widget and transform to list with .toList() method and it goes list
          // u can also use like this
          // children: transactions.map((tx) {
          //    ...
          // }).toList(),
        ));
  }
}
