import 'package:flutter/material.dart';
import 'package:stajapp1/screens/name.dart';
import 'package:stajapp1/screens/signUp.dart';
import 'package:stajapp1/screens/welcomepage.dart';
import 'package:stajapp1/src/constants.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController e_mailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final formKey1 = GlobalKey<FormState>();

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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 200, left: 30, right: 30),
          child: Column(
            children: [
              MyTextField(
                hintText: 'sadsadsa',
                inputType:TextInputType.text ,

              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child:Form(
                  key: formKey,
                  child: TextFormField(
                  validator: (val) {
                    if (val!.length < 4) {
                      return "Minimum required 4 or more";
                    } else {
                      return null;
                    }
                  },
                  style: kBodyText.copyWith(
                    color: Colors.black87,
                  ),
                  obscureText: isPasswordVisible,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility,color: Colors.black87,), onPressed: () { setState(() {
                          isPasswordVisible=!isPasswordVisible;
                      }); },
                    ),
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Password',
                      hintStyle: kBodyText,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                            width: 1,
                          )
                      )
                  ),
                ),
                ),
              ),
              TextButton(onPressed: () {}, child: Text('Forgot Password')),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
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

                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Name()),
                        );
                        print(  " /Kullanıcı İsmi Girildi");
                      } else {
                        print("hatalı giriş");
                      }


                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key, required this.hintText, required this.inputType,
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: 'Email Adress',
          hintStyle: kBodyText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            )
          )
        ),
      ),
    );
  }
}
