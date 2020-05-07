import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_exp/widgets/chartBar.dart';

import '../models/transaction.dart';

class Charts extends StatelessWidget {
  final List<Transaction> transactions;

  Charts(this.transactions);

  List<Map<String, Object>> get calculateWeeklySpends {
    var fullTotal = 0.0;

    for (var tx in transactions) {
      fullTotal += tx.amount;
    }

    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(
        days: index,
      ));
      var total = 0.0;

      for (var tx in transactions) {
        if (tx.date.day == weekday.day &&
            tx.date.year == weekday.year &&
            tx.date.month == weekday.month) {
          total += tx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).toString().substring(0, 1),
        'total': total.toStringAsFixed(0),
        'sum': fullTotal.toStringAsFixed(0),
        'weekday': weekday.weekday
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ...calculateWeeklySpends.map((daytx) {
            return ChartBar(
              daytx['day'],
              double.parse(daytx['total']),
              (double.parse(daytx['total']) / double.parse(daytx['sum'])),
            );
          }).toList()
        ],
      ),
    );
  }
}
