import 'package:flutter/material.dart';
import 'package:training_flutter_widgets_project/models/transaction.dart';
import 'package:training_flutter_widgets_project/widgets/chart.dart';
import 'package:training_flutter_widgets_project/widgets/new_transaction.dart';
import 'package:training_flutter_widgets_project/widgets/user_transaction.dart';

// import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';
import './widgets/simple_ecommerce.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // to get form value
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> transactions = [];

  // get last 7 days transactions
  // var a = DateTime.now().subtract(const Duration(days: 7)) က ဒီနေ့ကနေ လွန်ခဲ့တဲ့(၇)ရက်ရောက်သွားတယ်
  // Loop ပတ်လိုက်တဲ့ transaction တခုချင်းစီရဲ့ နေ့က a ပြီးမှလာတာကို လိုချင်ရင်    --> isAfter
  // Loop ပတ်လိုက်တဲ့ transaction တခုချင်းစီရဲ့ နေ့က a မတိုင်ခင်လာတာကို လိုချင်ရင် --> isBefore
  List<Transaction> get lastSevenTransactions {
    return transactions.where((trans) {
      return trans.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  /// adding new transaction
  void addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
    );

    setState(() {
      transactions.add(newTx);
    });
  }

  /// deleting  transaction
  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((tran) => tran.id == id);
    });
  }

  // open modal when floating action bottom clicked
  void startAddNewTransaction(BuildContext ctx) {
    // showModal... is the modal
    showModalBottomSheet(
        isScrollControlled: true,
        context: ctx,
        builder: (_) {
          // to detect the user's touching on the screen use GestureDetector
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(addNewTransaction: addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // custom font
        title: const Text(
          'Personal Expense',
          style: TextStyle(fontFamily: "OpenSans"),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => startAddNewTransaction(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Chart(recentTransactions: lastSevenTransactions),
            // transaction list
            UserTransaction(
                transactions: transactions,
                deleteTransaction: deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
