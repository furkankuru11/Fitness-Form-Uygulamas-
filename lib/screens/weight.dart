import 'package:flutter/material.dart';
import 'package:stajapp1/screens/lenght.dart';
import 'package:stajapp1/src/numberpicker.dart';


class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Lenght()));
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
  int _currentIntValue = 40;
  int userWeight=0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Container(
      margin: EdgeInsets.only(top: 100),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            "How much is your Weight ?",
            style: TextStyle(fontSize: 24),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: NumberPicker(
              itemHeight: 50,
              value: _currentIntValue,
              minValue: 40,
              maxValue: 150,
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
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    userWeight=_currentIntValue;
                    _showDialog();
                  });
                  debugPrint("Kilo Girildi Form Dolduruldu \ "+userWeight.toString());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //sadece butonlara basınca ekrandan çıkıyor
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Container(
            alignment: Alignment.center,
            child: Text("Successful",style: TextStyle(
              color: Colors.black87,
            ),),
          ),
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              child: MaterialButton(
                shape: StadiumBorder(),
                minWidth: 100,
                color: Colors.blueAccent,
                child: new Text("Okey",style: TextStyle(
                  color: Colors.white,
                ),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
