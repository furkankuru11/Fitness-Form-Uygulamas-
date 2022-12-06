import 'package:flutter/material.dart';
import 'package:stajapp1/screens/gender.dart';
import 'package:stajapp1/screens/old.dart';
import 'package:stajapp1/screens/welcomepage.dart';

import 'gender.dart';
import 'package:stajapp1/src/user_info.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name>  {
  TextEditingController nameController = TextEditingController();
  late String userName;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WelcomePage()));
        },
      ),
      body: Container(
        padding: EdgeInsets.only(top: 150),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, right: 160, bottom: 100),
            child: Text(
              "Your Name ?",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextFormField(
                controller: nameController,
                validator: (val) {
                  if (val!.length < 3) {
                    return "Minimum required 3 or more";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0,150, 0, 0),
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
                  userName = nameController.text;
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Gender()),
                    );
                    print(userName + " /Kullanıcı İsmi Girildi");
                  } else {
                    print("hatalı giriş");
                  }

                  //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => Gender()),
                  //);
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
