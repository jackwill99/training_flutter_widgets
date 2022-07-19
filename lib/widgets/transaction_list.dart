import 'package:flutter/material.dart';
import 'package:training_flutter_widgets_project/models/transaction.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transaction> transactions;
  Function(String) deleteTransaction;

  TranscationList(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: transactions.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: Image.asset("assets/images/noTransaction.png"),
                  )
                ],
              )
            : ListView.builder(
                // ListView is same with Column but it has singlechildscrollview property
                // ListView.builder builds widgets as required (i.e when they can be seen) not holding more items list.
                // So it gets more performance
                // context is the meta object which holds information about the position of the widget in the widget tree
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\$ ${transactions[index].amount}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(transactions[index].title),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          deleteTransaction(transactions[index].id);
                        },
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                  // first way of creating list
                  // return Card(
                  //     child: Row(
                  //   children: <Widget>[
                  //     Container(
                  //       margin: const EdgeInsets.symmetric(
                  //           vertical: 10, horizontal: 15),
                  //       padding: const EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10)),
                  //         border: Border.all(color: Colors.purple, width: 2),
                  //       ),
                  //       child: Text(
                  //         '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                  //         style: const TextStyle(
                  //             fontSize: 17,
                  //             color: Colors.purple,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(
                  //           transactions[index].title,
                  //           style: Theme.of(context).textTheme.headline6,
                  //         ),
                  //         Text(
                  //           // intl data format
                  //           // DateFormat("dd-MMMM-yyyy").format(tx.date),
                  //           DateFormat.yMMMd().format(transactions[index].date),
                  //           style: const TextStyle(color: Colors.grey),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ));
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
