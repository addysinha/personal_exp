import 'package:flutter/material.dart';
import './combineTxFormList.dart';

class TransactionForm extends StatelessWidget {
  var titleTextEditController = TextEditingController();
  var amountTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title', contentPadding: EdgeInsets.all(5)),
              controller: titleTextEditController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount', contentPadding: EdgeInsets.all(5)),
              controller: amountTextEditController,
            ),
            FlatButton(onPressed: (varTitle, varAmount) => {
            CombineTxFormAndList().sub
            },
                child: Text('Submit Transaction'))
          ],
        ),
      ),
    );
  }
}
