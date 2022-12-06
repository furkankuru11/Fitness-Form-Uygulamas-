import 'package:flutter/material.dart';
import 'package:stajapp1/screens/gender.dart';
import 'package:stajapp1/screens/lenght.dart';

import 'package:stajapp1/src/numberpicker.dart';

class Old extends StatefulWidget {
  const Old({Key? key}) : super(key: key);

  @override
  State<Old> createState() => _OldState();
}

class _OldState extends State<Old> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Gender()));
            },
          ),
          body: Container(
            child: _IntegerExample(),
          )),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentIntValue = 10;
  int userOld=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            "How old are you ?",
            style: TextStyle(fontSize: 24),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: NumberPicker(
              itemHeight: 50,
              value: _currentIntValue,
              minValue: 10,
              maxValue: 90,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => _currentIntValue = value),
            ),
          ),
          SizedBox(height: 32),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(top:0,right: 10,left: 10),
            child: SizedBox(
              width: 300,
              height: 45,
              child: RaisedButton(
                color: Colors.blue[900],
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  userOld=_currentIntValue;
                  debugPrint("Yaş girildi \ "+userOld.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Lenght()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
