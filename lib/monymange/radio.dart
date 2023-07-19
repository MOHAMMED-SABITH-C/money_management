import 'package:flutter/material.dart';

class MyRadioButtons extends StatefulWidget {
  @override
  _MyRadioButtonsState createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  // Define the currently selected option
  int _selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return //Scaffold(
      // appBar: AppBar(
      //   title: Text('Radio Buttons Example'),
      // ),
      // body:
       Container(
        height: 50,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 50,),

            // Option 1
            Radio<int>(
              // title: Text('Option 1'),
              value: 1,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = 1;
                });
              },
            ),
            Text('Income'),
            SizedBox(width: 50,),
            // Option 2
            Radio<int>(
              // title: Text('Option 2'),
              value: 2,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption =2;
                  // return _selectedOption;
                });
              },
            ),
            Text('Expence'),
            SizedBox(width: 50,),

            // Option 3
            // Radio(
            //   // title: Text('Option 3'),
            //   value: 3,
            //   groupValue: _selectedOption,
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedOption = 3;
            //     });
            //   },
            // ),

          ],
        ),
       );
    // );
  }
}