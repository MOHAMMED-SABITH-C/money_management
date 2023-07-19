import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneymanage/monymange/popup.dart';
import 'package:moneymanage/personalMM/model.dart';

// import 'package:flutter_application_2/personalMM/model.dart';

import '../personalMM/db_money1.dart';

class Category extends StatefulWidget {
  const Category({super.key,required this.t});
  final String t;

  @override
  State<Category> createState() =>t=='Income'?CategoryState():CategoryStateExp();
}

class CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    IE(widget.t);

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: UserMoneyDetails ,
           builder:(BuildContext context,List<userDetails> userList ,Widget? child) {
             return ListView.separated(
              itemBuilder: (context, index) {
                final data=userList[index];
                return ListTile(
                  title: Text(data.type),

                  onTap: () {
                    Showpopup(context,data.type,data.amount,widget.t);
                  },
                  trailing: IconButton(
                    onPressed: (){
                      deleteDataU(data.id!);
                      IE(widget.t);
                  }, icon: Icon(Icons.delete),color: Colors.red,),
                );
              },
               separatorBuilder: ((context, index) {
                 return const Divider(thickness: 10,);
               }),
                itemCount: userList.length
                );
           }) 
           )
      // ),
    );
  }
}

class CategoryStateExp extends State<Category> {
  @override
  Widget build(BuildContext context) {
    IE(widget.t);

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: UserMoneyDetailsE ,
           builder:(BuildContext context,List<userDetails> userList ,Widget? child) {
             return ListView.separated(
              itemBuilder: (context, index) {
                final data=userList[index];
                return ListTile(
                  title: Text(data.type),

                  onTap: () {
                    Showpopup(context,data.type,data.amount,widget.t);
                  },
                  trailing: IconButton(
                    onPressed: (){
                      deleteDataU(data.id!);
                        
                      IE(widget.t);
                  }, icon: Icon(Icons.delete),color: Colors.red,),
                );
              },
               separatorBuilder: ((context, index) {
                 return const Divider(thickness: 10,);
               }),
                itemCount: userList.length
                );
           },
           ) ,
          //  Divider(thickness: 10,)
           ),
      // ),
    );
  }
}