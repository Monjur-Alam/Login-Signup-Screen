import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/components/already_have_an_account_check.dart';
import 'package:flutter_auth/components/or_divider.dart';
import 'package:flutter_auth/components/rounded_blood_input_field.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_fb_input_field.dart';
import 'package:flutter_auth/components/rounded_mobile_input_field.dart';
import 'package:flutter_auth/components/rounded_name_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/components/social_icon.dart';
import 'package:flutter_auth/models/data_model.dart';
import 'package:flutter_auth/models/model.dart';
import 'package:flutter_auth/screens/deshboard.dart';
import 'package:flutter_auth/screens/welcome_screen.dart';
import 'package:flutter_auth/utils/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpTeacherScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpTeacherScreen> {
  String name;
  String dep = 'MECHANICAL ENGINEERING';
  String mobile;
  String blood;
  String fb;
  String identity = '0';
  String status = '1';
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/signup_top.png"),
              width: size.width * 0.35,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png"),
              width: size.width * 0.23,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  Text(
                    "SignUp",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        foreground: Paint()..shader = linearGradient),
                  ),
                  SizedBox(height: 10),
                  SvgPicture.asset(
                    "assets/images/signup.svg",
                    height: size.height * 0.25,
                  ),
                  SizedBox(height: 10),
                  RoundedNameInputField(
                    hintText: "Teacher Name",
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  DropdownButton<String>(
                    value: dep,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 3,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dep = newValue;
                      });
                    },
                    items: <String>[
                      'MECHANICAL ENGINEERING',
                      'CIVIL ENGINEERING',
                      'ARCHITECTURE',
                      'LAW',
                      'CSE'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  RoundedBloodInputField(
                    hintText: "Blood Group",
                    onChanged: (value) {
                      blood = value;
                    },
                  ),
                  RoundedFbInputField(
                    hintText: "Facebook Link",
                    onChanged: (value) {
                      fb = value;
                    },
                  ),
                  RoundedMobileInputField(
                    hintText: "Mobile",
                    onChanged: (value) {
                      mobile = value;
                    },
                  ),
                  RoundedPasswordFiled(
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () async {
                      final dataModel = DataModel(name, dep, mobile,
                          blood, fb, identity, status, password);
                      try {
                        Response response = await post(Uri.parse('https://razipublications.org/api/registers'), body: dataModel.toJson());
                        Map data = jsonDecode(response.body);
                        String msg = data['msg'];
                        if (msg == 'inserted') {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs?.setString("mobile", mobile);
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('Successful'),
                                content: Text('Create Account Successfully'),
                                actions: [
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => Dashboard(),
                                        ),
                                            (route) => false,
                                      );
                                    },
                                  )
                                ],
                              ));
                        }
                      }
                      catch (e){
                        print('Caught error: $e');
                        final title = 'Fail';
                        final text = e;
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(title),
                              content: Text(text),
                              actions: [
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => WelcomeScreen(),
                        ),
                            (route) => false,
                      );
                    },
                    login: false,
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        iconSrc: "assets/icons/facebook.svg",
                        press: () {},
                      ),
                      SocialIcon(
                        iconSrc: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                      SocialIcon(
                        iconSrc: "assets/icons/google-plus.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
