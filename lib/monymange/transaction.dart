// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:moneymanage/dropdown.dart';
import 'package:moneymanage/personalMM/db_money1.dart';
import 'package:moneymanage/personalMM/db_transaction.dart';
import 'package:moneymanage/personalMM/model.dart';

class transac extends StatefulWidget {
  const transac({super.key});

  @override
  State<transac> createState() => transacState();
}

// final List=[
//   ''
// ];
//  final data=userDel[]

class transacState extends State<transac> {
  List<userDetails> userDel=[];
  late String dates;
  late int id;
  late String category;
  // late String type;

  //late
   userDetails? _selectedItem=null;//= userDetails(type: '', category: '', amount: '');  //getList('Income').then((value) { _selectedItem=value[0]});
  @override
  void initState(){
    // IE('Income');
  getList('Income').then((Element){
    userDel=Element;
  //  _selectedItem = value[0];
  });
    super.initState();
  }

///////////////////reload the data when this page is selected;;;;;;;;/////////////////////////////////////////
@override
void didChangeDependencies(){
  super.didChangeDependencies();
  
  getList('Income').then((data){
    userDel=data;
  });
}

 final _textControl=TextEditingController();
 final _textControl2= TextEditingController();

 DateTime selectedDates = DateTime.now();
 late DateTime date = DateTime.now();
 late String  d=date.toString();
//  late int time = int.parse(d); 

  int groupValue=1;
  @override
  Widget build(BuildContext context) {
    // initialiZes().
    // initState();
    return Scaffold(
    appBar:AppBar(actions: [Icon(Icons.arrow_back)],),
      body: SafeArea(
        child:Column(
          children: [
            TextField(
              controller: _textControl,
              decoration: InputDecoration(
              label:Text('Purpose'),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _textControl2,
              keyboardType:TextInputType.number ,
              decoration: InputDecoration(
              label:Text('Amount'),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1
                        , groupValue: groupValue,
                         onChanged: ((value) {
                           setState(() {
                             groupValue=1;
                             getList('Income').then((valu){
                              userDel=valu;
                              // _selectedItem = valu[0];
                                _selectedItem=null;

                            //  print(valu);
                             });
                            //  IE('Income');
                            //  Navigator.of(context).pop();
                            //  showBottomSheet(context);
                           });
                          print('clicked1 $groupValue');
                         })
                         ),
                         Text('Income'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2
                        , groupValue: groupValue,
                         onChanged: ((value) {
                           setState(() {
                             groupValue=2;
                             getList('Expense').then((data) {
                              userDel=data;
                            //  _selectedItem = data[0];
                                _selectedItem=null;

                              // print(userDel);
                             });
                            //  IE('Expense');
                            //  Navigator.of(context).pop();

                            //  showBottomSheet(context);
                           });
                          print('clicked2 $groupValue');
                         })
                         ),
                         Text('Expense')
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10,),
              //////////////calander/////////////////
              ElevatedButton.icon(
                onPressed: ()async{
                final selectedDate = await showDatePicker(
                  context: context,
                   initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days:30)),
                     lastDate: DateTime.now(),
                     );
                    //  if(selectedDate == null)

                     print(selectedDate);
                     setState(() {
                       selectedDates = selectedDate!;
                       date=selectedDates;
                       d=date.toString();
                      //  time = int.parse(d); 

                     });
                    
              },
               icon: Icon(Icons.calendar_month),
               ///////////////////////split using in a string//////////////
              
                label: Text(d.split(" ")[0])
                ),
                DropdownButtonFormField<userDetails>(
                  value: _selectedItem,
                  hint: Text('Select Category'),
                  items:userDel.map((userDetails e) {
                      // print(e);
                    return DropdownMenuItem<userDetails>(
                      value: e,
                      child:Text(e.type),
                  onTap: () {
                    setState(() {
                            id=e.id!;
                            category=e.type;
                      // getList('Income').then((data) {
                      //   userDel=data;
                      // },);
                    });
                  },
                       );
                  }).toList() ,
                  onChanged: (userDetails? value) {
                    setState(() {

                      _selectedItem = value!;
                        print(value.id);
                     
                    });
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    final String s=_textControl.text.trim();
                    final String s2=_textControl2.text.trim();
                    final det =  transactions(purpose: s, id:id, date: d, category: category, amount: s2);
                    addTran(det);
                },
                 child: Text("Submit")
                 )
          ],
          ) 
          ),
    );
  }
}