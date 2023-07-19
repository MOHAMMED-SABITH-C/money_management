import 'package:flutter/material.dart';
import 'package:moneymanage/main.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:moneymanage/monymange/transaction.dart';
import 'package:moneymanage/personalMM/db_transaction.dart';

import '../personalMM/db_money1.dart';
import 'package:moneymanage/personalMM/model.dart';


class transaction extends StatefulWidget {
  const transaction({super.key});

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  @override
  Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;  
  final screenheight = MediaQuery.of(context).size.height;
    String? st;
  getDet();
    return Scaffold(
      body: SafeArea(
        child:ValueListenableBuilder(
          valueListenable: UserMoneytransaction,
           builder: (BuildContext context, List<transactions> userdata,Widget? child) {
             return ListView.separated(
                padding: const EdgeInsets.all(10),
              itemBuilder: ((context, index) {
                final data=userdata[index];
                // find(data.id).then((String value) {
                //   setState(() {
                    
                //   st=value; 
                //   });
                //   } );
                print('${st}\t${data.category}\t${find(data.id)}');
                String strin = data.date.toString();
                final  splited= strin.split(' ');
                final str= splited[0].split('-');
                return Stack(children:[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(height: 60,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Color.fromARGB(255, 204, 14, 0),
                    ),
                    width: screenWidth-2,
                      // color:Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            Column(
                              children: [
                            Icon(Icons.delete),

                            Text('Delete')
                              ],
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return transaction();
                                })
                              );
                            }, child: Text('NO')),
                            ElevatedButton(onPressed: (){
                          delt(data.id,data.purpose);
                            }, child: Text('YES'))
                          ],
                        ),
                      )
                      ,),
                  ),
                // ],
                
                
                
                Dismissible(
                  key: Key((data.id).toString()),
                  confirmDismiss: (direction) async{
                    if(direction == DismissDirection.endToStart)
                       {
                        return false;
                       }

                        print(direction);
                        return true;
                  },
                  child: Card(
                    elevation: 0,
                    // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    // shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    shape:StadiumBorder(side: BorderSide(color: Colors.black,width: 2)),
                    child: 
                  ListTile(
                    leading: CircleAvatar(
                      // backgroundColor: find(data.id) != 'Expence' ? Colors.green : Colors.red,
                      backgroundColor: Colors.black,
                      radius: 50,
                      child:
                          Text('${str[2].toString()}\n${str[1].toString()}\n${str[0].toString()}', textAlign:TextAlign.center,style: TextStyle(fontSize: 10),),
                
                         
                    ),
                    title:Text(data.amount),
                    subtitle: Text(data.category),
                    // trailing: IconButton(
                    //   icon: Icon(Icons.delete),color: Colors.red,
                    //   onPressed: (){
                    //     delt(data.id,data.purpose);
                    // },),
                  ),
                  ),
                ),
               ], 
               ); 
              }),
              separatorBuilder: ((context, index) {
                return const Divider(thickness: 0.00001,);
              }),
              itemCount: userdata.length,
             );
           })),
          floatingActionButton: FloatingActionButton( 
            backgroundColor:Colors.purple,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return transac();
                })
              );
            },
            child:Icon(Icons.add),
            ),
        // ),
    ) ;


  }

  // String ParsDate(DateTime dates){
  //   return '${dates.day}\n${dates.month}';
  // }
}