import 'package:flutter/foundation.dart';

class Transaction {
  final String title;
  final double amount;
  final DateTime date;
  final String id;

  Transaction({this.id, this.title, this.amount, this.date});
  
}