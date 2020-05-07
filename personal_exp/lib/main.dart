import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transactionForm.dart';
import './widgets/transactionList.dart';
import './widgets/charts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.amberAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> _transactions = [
    new Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 120.54,
      date: DateTime.now(),
    ),
    new Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 543.34,
      date: DateTime.now(),
    ),
  ];

  void _modalBottomSheetDisplay(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: TransactionForm(_submitTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _submitTransaction(String varTitle, double varAmount, DateTime varDate) {
    if (varTitle.isEmpty || varAmount <= 0 || varDate == null) {
      print('Please enter a valid title or Number');
    } else {
      setState(() {
        _transactions.add(new Transaction(
            id: DateTime.now().toString(),
            title: varTitle,
            amount: varAmount,
            date: varDate));
      });

      //To be able to auto close modal sheet on submit
      Navigator.of(context).pop();
    }
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Transaction> _workingTransaction = _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _modalBottomSheetDisplay(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Charts(_workingTransaction),
            ),
            TransactionList(_transactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _modalBottomSheetDisplay(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
