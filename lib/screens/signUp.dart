import 'package:flutter/material.dart';
import 'package:stajapp1/screens/gender.dart';
import 'package:stajapp1/screens/welcomepage.dart';
import 'package:stajapp1/src/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final formKey1 = GlobalKey<FormState>();
    final formKey2 = GlobalKey<FormState>();
    String userName;
    String lastpw;
    String repw;

    TextEditingController nameController = TextEditingController();
    TextEditingController pw= TextEditingController();
    TextEditingController pwController = TextEditingController();
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
          padding: EdgeInsets.only(top: 120, left: 30, right: 30),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: TextFormField(
                  validator: (val) {
                    if (val!.length < 3) {
                      return "Minimum required 3 or more";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,

                  textInputAction: TextInputAction.next,
                  controller: nameController,

                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Form(
                key: formKey1,
                child: TextFormField(
                  obscureText: isPasswordVisible,

                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (password) {
                    if (password!.length < 4) {
                      return "Minimum required 4 or more";
                    } else {
                      return null;
                    }
                  },
                  controller: pw,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(Icons.visibility,color: Colors.black87,), onPressed: () { isPasswordVisible=!isPasswordVisible;},
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hintStyle: kBodyText,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Form(
                key: formKey2,
                child: TextFormField(
                  obscureText: isPasswordVisible,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (pwCont) {
                    if (pwCont!.length <4) {
                      return "Different password";
                    } else {
                      return null;
                    }
                  },

                  controller: pwController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility,color: Colors.black87,), onPressed: () { isPasswordVisible=!isPasswordVisible;},
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hintStyle: kBodyText,
                    border: OutlineInputBorder(),
                    labelText: 'Re-Write Password',
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Container(
                width: 300,
                child: const Center(
                  child: Text(
                    'Curabitur lobortis id lorem id bibendum.Ut id consectetur magna.Terms of Use augue enim,'
                    'pulvinar Privacy Notice laciana at',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                      userName = nameController.text;
                      lastpw=pw.text;
                      repw=pwController.text;
                      if (formKey.currentState!.validate() && formKey1.currentState!.validate() && formKey2.currentState!.validate() && lastpw==repw ) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Gender()),
                        );
                        print(userName + " \ Kullanıcı Adı");
                        print("Şifre \ "+lastpw);
                        print("Doğrulandı \ "+repw);
                      } else {
                        print("hatalı giriş");
                        print(lastpw);
                        print("Şifre Doğrulanamadı \ "+repw);
                      }

                      //Navigator.push(
                      //context,
                      //MaterialPageRoute(builder: (context) => Gender()),
                      //);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
