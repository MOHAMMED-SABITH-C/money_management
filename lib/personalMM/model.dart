// import 'dart:math';

import 'package:moneymanage/monymange/transaction.dart';

class userDetails{
  final String type;
   int? id;
  final String amount;
  final String category;

  userDetails({required this.type,required this.category,required this.amount,this.id});

  static userDetails fromMap(Map<String,Object?>map){
    
    final type = map['type'] as String;
    final id = map['id'] as int;
    final amount = map['amount'] as String;
    final category = map['category'] as String;

    return userDetails(type: type,category: category, amount: amount,id:id);
  }

}

// class ra{
//   final String category;
//   ra({required this.category});

//   static ra fromMap(Map<String,Object?>map){
//     final category = map['category'] as String;
//     return ra(category: category);
//   }
// }

class transactions{
  final String purpose;
   final int id;
   final String date;
  final String amount;
  final String category;

  transactions({required this.purpose,required this.id,required this.date,required this.category,required this.amount});

  static transactions fromMap(Map<String,Object?>map){
    
    final purpose = map['purpose'] as String;
    final date = map['dates'] as String;
    final id = map['id'] as int;
    final amount = map['amount'] as String;
    final category = map['category'] as String;

    return transactions(purpose: purpose,date: date,category: category, amount: amount,id:id);
  }

}