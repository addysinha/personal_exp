import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  var transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      '\$' + transactions[index].amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    )),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(transactions[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      Text(
                          DateFormat('yyyy-MM-dd')
                              .format(transactions[index].date),
                          style: TextStyle(
                            color: Colors.black38,
                          ))
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
