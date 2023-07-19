import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future <void> Showpopup(BuildContext context,String type,String amount ,String t)async{

showDialog(
  
  context:context,
  builder:(context){
    
    return SimpleDialog(
      
      title: Text(type,textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 30),),
      // backgroundColor: Colors.blue,


      children: [
        // Padding(padding: EdgeInsets.fromLTRB(130, 20, 130, 20)  //.all(10)
        // ,
        // child:
        Text(amount,textAlign: TextAlign.center,style: TextStyle(color:t=='Expense'? Colors.red:Colors.green,fontSize: 25,fontWeight:FontWeight.bold),),
        // ),
        Padding(padding: EdgeInsets.all(10),
        child:CloseButton(
          onPressed:(){
            Navigator.of(context).pop();
          }
        )
        ),
      ],
    );
  }
);
}