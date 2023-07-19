import 'package:flutter/cupertino.dart';
import 'package:moneymanage/personalMM/model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<userDetails>> UserMoneyDetails = ValueNotifier([]);
ValueNotifier<List<userDetails>> UserMoneyDetailsE =ValueNotifier([]);

late Database _db;

Future <void> initialiZe() async{
  _db = await openDatabase('userMoneyDetail01.db',
    version: 1,
    onCreate: (Database db,int version) async {
      db.execute('CREATE TABLE user (id INTEGER primary key AUTOINCREMENT ,type TEXT,amount TEXT,category TEXT)');
    },
  );
  getDet();
}

Future <void> addU(userDetails value,String t) async{

  print('adding');
  await _db.rawInsert('INSERT INTO user (type,amount,category) VALUES (?,?,?)',[value.type,value.amount,value.category]);
  // getDet();
  IE(t);
}

Future <void>getDet() async{

    print('details\n');
    final values= await _db.rawQuery('SELECT * FROM user');
    print(values);
    UserMoneyDetails.value.clear();

    values.forEach((element) {
      final obj=userDetails.fromMap(element);
      UserMoneyDetails.value.add(obj);
      UserMoneyDetails.notifyListeners();
     });

}

Future <void>deleteDataU(int id)async{
  await _db.rawDelete('Delete from user WHERE id=?',[id]);
  // getDet();
  // IE(type);
}

Future <void>IE(String t)async{
  final val=await _db.rawQuery('Select * from user where category=?',[t]);
  if(t=='Income'){

  UserMoneyDetails.value.clear();
  val.forEach((element) {
    final obj=userDetails.fromMap(element);
    UserMoneyDetails.value.add(obj);
    UserMoneyDetails.notifyListeners();
  });
  }else{

  UserMoneyDetailsE.value.clear();
  val.forEach((element) {
    final obj=userDetails.fromMap(element);
    UserMoneyDetailsE.value.add(obj);
    UserMoneyDetailsE.notifyListeners();
  });
  }

}
////////// return list of datas ////////////////////////////////////////////////

Future <List<userDetails>> getList(String ty)async{
  final List<Map<String,dynamic>> maps = await _db.rawQuery('Select * from user where category=?',[ty]);
  return List.generate(maps.length, (i){
    return userDetails.fromMap(maps[i]);
  } );
}
Future <String> find(int id)async{
  final val=await _db.rawQuery('Select category from user where id=?',[id]);
  print('${val[0].toString()}\t\t hihoware');
  if(val[0].toString() == '{category: Expense}')
    return 'Expence';
  else
    return '${val[0].toString()}';
}
