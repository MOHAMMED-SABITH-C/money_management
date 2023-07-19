import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:moneymanage/monymange/fluidbar.dart';
// import 'package:moneymanage/monymange/transaction.dart';
import 'package:moneymanage/monymange/transactionDisp.dart';

// import '../Displaydb.dart';
// import '../buttenNavig.dart';
// import '../list.dart';

//bottomnavi bar
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class topbar extends StatefulWidget {
  const topbar({super.key});

  @override
  State<topbar> createState() => _topbarState();
}

class _topbarState extends State<topbar> {
  final item=[
    // BottomNavigation(table:'Electronic Devices'),
    transaction(),
    fluidbar()
  ];
  // Widget? _child;
  int _currentInd=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      // appBar: AppBar(
      //     backgroundColor: Color.fromARGB(255, 255, 255, 255),
        
      //   actions: [
      
      //   FluidNavBar(
      //   icons: [
      //     FluidNavBarIcon(
      //       icon: Icons.home,
      //       backgroundColor: Colors.black,
      //       selectedForegroundColor: Colors.white,
      //       extras:{"label":"home"}
      //     ),
      //     FluidNavBarIcon(
      //       icon:Icons.payment_outlined,
      //       backgroundColor: Colors.black,
      //       selectedForegroundColor: Colors.white,
      //       extras: {'label':'payment'}
      //       )
      // ],
      // onChange: _handleNavigationC2,
      // style: FluidNavBarStyle(
      //   barBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      //   iconBackgroundColor: Colors.white,
      //   iconUnselectedForegroundColor: Colors.red,
      // ),
      // ),


  
      //   BottomNavyBar(
      //     selectedIndex: _currentInd,
      //     // showElevation: true,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     itemCornerRadius: 24,
      //     curve: Curves.easeIn,
      //     items: [
      //       BottomNavyBarItem(
      //         icon: Icon(Icons.home),
      //          title: Text("Transaction"),
      //          activeColor: Colors.red,
      //          textAlign: TextAlign.center,
      //          ),
      //       BottomNavyBarItem(
      //         icon: Icon(Icons.category_outlined),
      //          title: Text("Category"),
      //          activeColor: Colors.purple,
      //          textAlign: TextAlign.center,
      //          )
      //     ],
      //      onItemSelected: ((value) => setState(() {
      //        _currentInd=value;
      //      })
      //      ),
      //      ),  
      // ],
      // ),

      // body: _child,
      body: item[_currentInd],
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentInd,
          // showElevation: true,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
               title: Text("Transaction"),
               activeColor: Colors.red,
               textAlign: TextAlign.center,
               ),
            BottomNavyBarItem(
              icon: Icon(Icons.category_outlined),
               title: Text("Category"),
               activeColor: Colors.purple,
               textAlign: TextAlign.center,
               )
          ],
           onItemSelected: ((value) => setState(() {
             _currentInd=value;
           })
           ),
           ),
    );
  }

    // void _handleNavigationC2(int index){
    // setState(() {
    //   switch(index){
    //     case 0: _child=BottomNavigation(table:'Electronic Devices');//listcreations(type:'Electronic Devices',);
    //       break;
    //     case 1:_child=fluidbar(); //listcreation0(type:'Electronic Devices');
    //     break;
    //   }
    //   _child=AnimatedSwitcher(
    //     duration: Duration(milliseconds: 500),
    //     child: _child,
    //     );
    //   });
    // }
}