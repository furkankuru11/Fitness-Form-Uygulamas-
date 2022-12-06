import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stajapp1/src/gender_provider.dart';
import 'package:stajapp1/screens/name.dart';
import 'package:stajapp1/screens/old.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String gender="";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GenderProvider>(
      create: (context) => GenderProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Name()));
            },
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<GenderProvider>(
                  builder: (context, genderProvider, _) => Text(
                    'What is your sex ?',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    // MALE
                    Expanded(
                      child: Consumer<GenderProvider>(
                        builder: (context, genderProvider, _) =>
                            GestureDetector(
                          onTap: () {
                            genderProvider.isMale = true;
                            gender="Erkek";
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: genderProvider.maleColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/image/icon_male.png',
                                  height: 80,
                                  color: genderProvider.maleColor,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: genderProvider.maleColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    // FEMALE
                    Expanded(
                      child: Consumer<GenderProvider>(
                        builder: (context, genderProvider, _) =>
                            GestureDetector(
                          onTap: () {
                            genderProvider.isMale = false;
                            gender="Kadın";
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: genderProvider.femaleColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/image/icon_female.png',
                                  height: 80,
                                  color: genderProvider.femaleColor,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: genderProvider.femaleColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top: 100),
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

                        debugPrint("Cinsiyet seçildi \ "+gender);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Old()),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
