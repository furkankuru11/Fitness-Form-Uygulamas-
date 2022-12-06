import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stajapp1/screens/welcomepage.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignInAccount? _currentUser;
  @override
  void initState() {
    // TODO: implement initState
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/image/logo1.png",
              height: 200,
            ),
          ),
          Container(
            child: const Center(
              child: Text(
                "Kaliteli Sporun Adresi..",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60),
                child: SignInButton(
                    buttonType: ButtonType.mail,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      print('mail');
                    }),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: SignInButton(
                    buttonType: ButtonType.google,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      print('google');
                    }),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: SignInButton(
                    buttonType: ButtonType.githubDark,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      print('githup');
                    }),
              ),

            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 330,
                height: 45,
                child: RaisedButton(
                  color: Colors.blue[900],
                  child: Text(
                    "Contiune with out sign up",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    debugPrint("Kullanıcı girişi başarılı");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
