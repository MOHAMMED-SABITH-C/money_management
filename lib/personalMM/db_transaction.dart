import 'package:flutter/cupertino.dart';
// import 'package:flutter_application_2/monymange/transaction.dart';
// import 'package:flutter_application_2/monymange/transactionDisp.dart';
import 'package:moneymanage/personalMM/model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<transactions>> UserMoneytransaction = ValueNotifier([]);

late Database _db1;

Future <void> initialiZes() async{
  _db1 = await openDatabase(' userMoneytr01.db ',
    version: 1,
    onCreate: (Database db,int version) async {
      db.execute(' CREATE TABLE transaction1 ( id INTEGER ,dates TEXT,purpose TEXT,amount TEXT,category TEXT,primary key ( id,purpose)) ');
    },
  );
  getTran();
}


Future <void> addTran(transactions value) async{
  await _db1.rawInsert(' INSERT INTO transaction1 (id,dates,purpose,amount,category) VALUES (?,?,?,?,?) ',[value.id,value.date,value.purpose,value.amount,value.category]);
  print('adding');
  getTran();
}

Future<void> getTran() async{
  print("details");
  final values= await _db1.rawQuery(' SELECT* FROM transaction1 order by dates DESC ');
  print(values);
    // values.sort((first,second)=>second.dates.compareTo(first.dates));
  UserMoneytransaction.value.clear();
  values.forEach((element) {
    final objec=transactions.fromMap(element);
    UserMoneytransaction.value.add(objec);
    UserMoneytransaction.notifyListeners();
  });
}

Future <void> delt(int id,String purp) async{
  await _db1.rawDelete(' delete from transaction1 where id=? and purpose=? ',[id,purp]);
  getTran();
}