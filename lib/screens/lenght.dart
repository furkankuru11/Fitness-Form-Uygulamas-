import 'package:flutter/material.dart';
import 'package:stajapp1/screens/gender.dart';
import 'package:stajapp1/screens/old.dart';
import 'package:stajapp1/screens/weight.dart';
import 'package:stajapp1/src/numberpicker.dart';

class Lenght extends StatefulWidget {
  const Lenght({Key? key}) : super(key: key);

  @override
  State<Lenght> createState() => _LenghtState();
}

class _LenghtState extends State<Lenght> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>Old()));
        },
      ),

      body: _IntegerExample(),
    );

  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentIntValue = 150;
  int userLenght=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text("How much is your lenght ?",style: TextStyle(
              fontSize: 24
          ),),
          Container(
            child: NumberPicker(

              itemHeight: 50,
              value: _currentIntValue,
              minValue: 150,
              maxValue: 220,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => _currentIntValue = value),
            ),

          ),

          SizedBox(height: 52),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              width: 330,
              height: 45,
              child: RaisedButton(
                color: Colors.blue[900],
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  userLenght=_currentIntValue;
                  debugPrint("Boy girildi \ "+userLenght.toString());
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>Weight()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
