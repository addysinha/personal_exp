import 'package:flutter/material.dart';

import './transactionForm.dart';
import './transactionList.dart';
import '../models/transaction.dart';

class CombineTxFormAndList extends StatefulWidget {
  @override
  _CombineTxFormAndListState createState() => _CombineTxFormAndListState();
}

class _CombineTxFormAndListState extends State<CombineTxFormAndList> {
  final List<Transaction> transactions = [
    new Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 175.22,
      date: DateTime.now(),
    ),
    new Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 15.34,
        date: DateTime.now()),
  ];

  void submitTransaction(varTitle, varAmount) {
    setState(() {
      transactions.add(new Transaction(
          id: DateTime.now().toString(),
          title: varTitle,
          amount: double.parse(varAmount),
          date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(submitTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
