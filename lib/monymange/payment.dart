// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sqflite/sqflite.dart';

// import '../personalMM/db_money1.dart';
// import 'categories.dart';
// import 'transaction.dart';

// class payment extends StatefulWidget {
//   const payment({super.key});

//   @override
//   State<payment> createState() => _paymentState();
// }

// class _paymentState extends State<payment> {

//   int index=0;
//   final list=[
//     // transaction('Expence'), 
//     category(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//   getDet();
//     return Scaffold(
//       // appBar: AppBar(actions: [
//       //   BottomNavigationBar(
//       //   currentIndex: index,
//       // onTap: (value ) {
//       //   setState(() {
//       //     index=value;
//       //   });
//       // },
//       //   items:[
//       //     BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Transaction'),
//       //     BottomNavigationBarItem(icon: Icon(Icons.category_rounded),label:'Categories')

//       //   ] 
//       //   ),
//       // ]),
//       body:list[index],


//     //  bottomNavigationBar: 
      

//     );
//   }
// }

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Trans extends StatefulWidget {
  const Trans({super.key});

  @override
  State<Trans> createState() => _TransState();
}

class _TransState extends State<Trans> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}