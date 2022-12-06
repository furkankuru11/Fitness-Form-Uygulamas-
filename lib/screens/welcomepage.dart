import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stajapp1/screens/loginScreen.dart';
import 'package:stajapp1/screens/name.dart';
import 'package:stajapp1/screens/signIn.dart';
import 'package:stajapp1/screens/signUp.dart';
import 'package:stajapp1/src/constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/image/logo1.png",
                height: 300,
              ),
            ),
            Container(
              child: Text(
                'Register easily',
                style: kHeadline,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
              child: Text(
                'Subscribe to our gym for healthy days,Subscribe to our gym for healthy days,Subscribe to our gym for healthy days',
                style: kBodyText,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.only(right: 25,left: 25),
                    height: 50.0,
                    minWidth: 300.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("Sign in",style: kBodyText2,),
                    onPressed: () {
                      print("SignIn");
                      setState(() {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => SignIn()));
                      });
                    },
                    splashColor: Colors.blue[900],
                  ),
                  SizedBox(height: 20,),
                  MaterialButton(
                    padding: EdgeInsets.only(right: 25,left: 25),
                    height: 50.0,
                    minWidth: 300.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("Sign up",style: kBodyText2,),
                    onPressed: () {
                      print("SignUp");
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      });
                    },
                    splashColor: Colors.blue[900],
                  )
                  ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);
  final String buttonName;
  final Function onTap;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(18)),
      child: TextButton(
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.resolveWith((states) => Colors.black12)),
        onPressed: () {},
        child: Text(
          buttonName,
          style: kButtonText.copyWith(color: textColor),
        ),
      ),
    );
  }
}
