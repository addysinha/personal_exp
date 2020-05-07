import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double total;
  final String label;
  final double totalPercentage;

  ChartBar(this.label, this.total, this.totalPercentage);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: <Widget>[
          FittedBox(
            child: Text("\$" + total.toString()),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: totalPercentage.isNaN ? 0 : totalPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(label)
        ],
      ),
    );
  }
}
