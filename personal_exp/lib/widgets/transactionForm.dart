import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  Function functionHandler;

  TransactionForm(this.functionHandler);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = new TextEditingController();
  final amountController = new TextEditingController();
  DateTime selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;
      setState(() {
        selectedDate = value;      
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  contentPadding: EdgeInsets.all(5),
                ),
                controller: titleController,
                onSubmitted: (_) {
                  widget.functionHandler(titleController.text,
                      double.parse(amountController.text),
                      selectedDate);
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  contentPadding: EdgeInsets.all(5),
                ),
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
                controller: amountController,
                onSubmitted: (_) {
                  widget.functionHandler(titleController.text,
                      double.parse(amountController.text),
                      selectedDate);
                },
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child:
                        Text(selectedDate == null ? 
                        'No Date Selected!' :
                        'Selected Date: ' + DateFormat.yMMMd().format(selectedDate)),
                  ),
                  FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text('Click to select Date'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      widget.functionHandler(titleController.text,
                          double.parse(amountController.text),
                          selectedDate);
                    },
                    child: Text(
                      'Submit Transaction',
                      style: TextStyle(color: Theme.of(context).buttonColor),
                    ),
                    padding: EdgeInsets.all(5),
                    textColor: Colors.blue,
                    focusColor: Colors.blueGrey,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
