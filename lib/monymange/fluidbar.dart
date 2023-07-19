import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
// import 'package:moneymanage/Displaydb.dart';
// import 'package:moneymanage/Users/RegisterU.dart';
import 'package:moneymanage/monymange/transaction.dart';
import 'package:moneymanage/monymange/payment.dart';
import 'package:moneymanage/monymange/radio.dart';
import 'package:moneymanage/monymange/Category.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/gestures.dart';
import 'package:moneymanage/personalMM/db_money1.dart';

import 'package:moneymanage/personalMM/model.dart';

// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

// import '../list.dart';

class fluidbar extends StatefulWidget {
   fluidbar({super.key});

  @override
  State createState() {return _fluidbarState();}
}

class _fluidbarState extends State<fluidbar> with SingleTickerProviderStateMixin{
  // late TabController _tabController;
  late TabController _toptabController = TabController(length: 2, vsync: this);

  final type =TextEditingController();
  final amount=TextEditingController();
  //  int _selectedValue = 1 ;
   int groupValue=1;
  //  int _selectedOption=2;
 
  // void initState(){
  //   super.initState();
  //   _selectedValue=1;
  // }
  
  // Widget? _child;

  // void initState(){
  //   super.initState();
  //   _tabController=TabController(length: 2, vsync: this);
  // }
  // void initState(){
  //   super.initState();
  //   _toptabController=TabController(length: 2, vsync: this);
  //   _toptabController.animateTo(2);
  //   // _child =payment();
  // }

  @override
  Widget build(BuildContext context) {
  // _child = payment();
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        bottom: TabBar(
          controller: _toptabController,
          tabs: [
            const Tab(icon: Icon(Icons.money),text: 'Income',),
            // const Tab(icon: Icon(Icons.checkroom_outlined),text: 'checxk',),
            const Tab(icon: Icon(Icons.money_off_csred_outlined),text: 'Expense',)
          ]
        ),
        
      ),
      // appBar:AppBar(
      //   actions: [
        //bottomNavigationBar:
      //    FluidNavBar(
      //   icons: [
      //     FluidNavBarIcon(
      //       icon: Icons.home,
      //       backgroundColor: Color.fromARGB(0, 245, 9, 9),
      //       extras:{"label":"home"}
      //     ),
      //     FluidNavBarIcon(
      //       icon:Icons.payment_outlined,
      //       backgroundColor: Color.fromARGB(0, 111, 255, 1),
      //       extras: {'label':'payment'}
      //       )
      // ],
      // onChange: _handleNavigationC2,
      // ),
         // IconButton(onPressed: _handleNavigationC//(){
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder:((context) {
            //     return payment();
            //   }) )
            // );

            //}
          // ,
            // icon: Icon(Icons.set_meal_outlined)),
          // IconButton(onPressed: (){
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder:((context) {
          //       return payment();
          //     }) )
          //   );
          // }, icon: Icon(Icons.cloud_circle_outlined))
        //],
        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: [
        //     Tab(icon: Icon(Icons.cloud_circle_outlined),),
        //     Tab(icon: Icon(Icons.code_off_outlined),),
        //   ]
        //   ),
       //   ),
      backgroundColor: Colors.blue,

      body://SafeArea(

      // child:
      TabBarView(
        controller: _toptabController,
        children: [
        //  MyRadioButtons(),
        // payment(),
        Category(t:'Income'),
        // RegisterU(),
        Category(t:'Expense')
      ]),
       
       
      // ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          showBottomSheet(context);
        }
        ), 
      ////////////important
      // body: _child,
      //   child: 
      ///////////////////////////////////////////////////
      // bottomNavigationBar: FluidNavBar(
      //   icons: [
      //     FluidNavBarIcon(
      //       icon: Icons.home,
      //       backgroundColor: Color.fromARGB(0, 245, 9, 9),
      //       extras:{"label":"home"}
      //     ),
      //     FluidNavBarIcon(
      //       icon:Icons.payment_outlined,
      //       backgroundColor: Color.fromARGB(0, 111, 255, 1),
      //       extras: {"label":"payment"}
      //       )
      // ],
      // onChange: _handleNavigationC,
      // style: FluidNavBarStyle(
      //   // barBackgroundColor: Colors.blue,
      //   iconUnselectedForegroundColor: Colors.red
      //   ),
      // scaleFactor: 1.5,
      // defaultIndex: 0,
      // itemBuilder: (icon, item) => Semantics(
      //   label: icon.extras!["label"],
      //   child: item,
      // ),
      // ),
      ///////////////////////////////////////
      // ),
    );
  }
   
   Future<void> showBottomSheet(BuildContext context)  async{
    String t;
    if(groupValue==1){
      t='Income';
    }
    else{
      t='Expense';
    }
    showModalBottomSheet(

    context:context,
      builder:( context){
              // rad(context);
        return Container(
          
        // width:double.infinity,
        height: 500,
        color: Color.fromARGB(255, 118, 7, 193),
          child: Column(
            children: [
              CloseButton(
                onPressed: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: ((context) => transaction(t: t))
                  // ),
                  // ((route) => false)
                  // );
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: type,
                // onTap: () {
                //   setState(() {
                //     rad(context);
                //   });
                // },
                decoration: const InputDecoration(
                  
                  label: Text('Expense'),
                  border: OutlineInputBorder(
                    
                  borderRadius: BorderRadius.all(Radius.circular(15))
                  ) 
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: amount,
                decoration:const InputDecoration(
                  label: Text('amount'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                )
              ),
              SizedBox(height:20),
              // MyRadioButtons(),
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
                             Navigator.of(context).pop();
                             showBottomSheet(context);
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
                             Navigator.of(context).pop();

                             showBottomSheet(context);
                           });
                          print('clicked2 $groupValue');
                         })
                         ),
                         Text('Expense')
                    ],
                  ),
                ],
              )
//               // Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
//         // children: [
//           // Option 1
//           RadioListTile(
//             title: Text('Option 1'),
//             value: 1,
//             groupValue: _selectedOption,
//             onChanged: (value) {
//               setState(() {
//                 _selectedOption = 1;
//               });
//             },
//           ),
//           // Option 2
//           Radio<int>(
//             // title: Text('Option 2'),
//             value: 2,
//             groupValue: _selectedOption,
//             onChanged: (value) {
//               setState(() {
//                 _selectedOption =2;
//               });
//             },
//           ),
//           // Option 3
//           Radio<int>(
//             // title: Text('Option 3'),
//             value: 3,
//             groupValue: _selectedOption,
//             onChanged: (value) {
//               setState(() {
//                 _selectedOption = 3;
//               });
//             },
//           ),
//         ],
//       ),
              ,SizedBox(height: 10,),
              ElevatedButton.icon(
                onPressed: (){
                  String category;
                  if(groupValue == 1)
                   {
                    category='Income';
                        setState(() {
                          _toptabController.index=0;
                        });
                   }
                  else
                  {
                   category='Expense';
                  setState(() {
                    _toptabController.index=1;
                  });
                  } 
                  // sendData(context);
                  final _obj=userDetails(category:category,amount:amount.text.trim(),type:type.text.trim());
                        addU(_obj,category);
              },
               icon: Icon(Icons.add),
                 label:Text('add')
               ),
            ],
          ),
        );
      }
    
    );
   }

  //  Future<void>sendData(context)async{
  //   final _type= type.text.trim();  
  //   final _amount = int.parse(amount.text.trim());
  //   final category;
  //   if(_selectedValue==1){
  //     category='Income';
  //   }else{
  //     category='Expence';
  //   }

  //   final _obj=userDetails(category:category,amount:_amount,type:_type);
  //   addU(_obj);
  //  }

  // void _handleNavigationC(int index){
  //   setState(() {
  //     switch(index){
  //       case 0: _child=payment();
  //         break;
  //       case 1:_child=transaction(); //listcreation0(type:'Electronic Devices');
  //       break;
  //     }
  //     _child=AnimatedSwitcher(
  //       // switchInCurve: Curves.easeOut,
  //       // switchOutCurve: Curves.easeIn,
  //       duration: Duration(milliseconds: 500),
  //       child: _child,
  //       );
  //     });
  //   }
  ///////////////////\
    //   void _handleNavigationC2(int index){
    // setState(() {
    //   switch(index){
    //     case 0: _child=listcreations(type:'Electronic Devices',);
    //       break;
    //     case 1:_child=listcreation0(type: 'Electronic Devices',); //listcreation0(type:'Electronic Devices');
    //     break;
    //   }
    //   _child=AnimatedSwitcher(
    //     duration: Duration(milliseconds: 500),
    //     child: _child,
    //     );
    //   });
    // }
    // import 'package:flutter/material.dart';

// class MyRadioButtons extends StatefulWidget {
//   @override
//   _MyRadioButtonsState createState() => _MyRadioButtonsState();
// }

// class _MyRadioButtonsState extends State<MyRadioButtons> {
  // Define the currently selected option
  
  // int _selectedOption = 1;

  // @override
  // Widget build(BuildContext context) {
  
  // Future <void> rad(BuildContext context) async {

  //   context:context;
  //   builder:(context){

  //    return //Scaffold(
  //     // appBar: AppBar(
  //     //   title: Text('Radio Buttons Example'),
  //     // ),
  //     // body:
  //      Container(
  //       height: 50,
  //       child: Row(
  //         // mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           SizedBox(width: 50,),

  //           // Option 1
  //           Radio<int>(
  //             // title: Text('Option 1'),
  //             value: 1,
  //             groupValue: _selectedValue,
  //             onChanged: (value) {
  //               setState(() {
  //                 _selectedValue = 1;
  //                 // return ;
  //               });
  //             },
  //           ),
  //           Text('Income'),
  //           SizedBox(width: 50,),
  //           // Option 2
  //           Radio<int>(
  //             // title: Text('Option 2'),
  //             value: 2,
  //             groupValue: _selectedValue,
  //             onChanged: (value) {
  //               setState(() {
  //                 _selectedValue =2;
  //                 // return _selectedOption;
  //               });
  //             },
  //           ),
  //           Text('Expence'),
  //           SizedBox(width: 50,),

  //           // Option 3
  //           // Radio(
  //           //   // title: Text('Option 3'),
  //           //   value: 3,
  //           //   groupValue: _selectedOption,
  //           //   onChanged: (value) {
  //           //     setState(() {
  //           //       _selectedOption = 3;
  //           //     });
  //           //   },
  //           // ),

  //         ],
  //       ),
  //      );
  //   };
  //   // );
  // }
}
  
// }