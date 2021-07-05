import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/screens/teacher_list.dart';
import 'package:flutter_auth/utils/constants.dart';

class TeacherDepartment extends StatelessWidget {
  const TeacherDepartment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('TEACHER DEPARTMENT'),
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/main_top.png"),
              width: size.width * 0.35,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/login_bottom.png"),
              width: size.width * 0.4,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  RoundedButton(
                    text: "ARCHITECTURE",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.pushNamed(context, 'teacher_list',
                          arguments: {"dep": "ARCHITECTURE"});
                    },
                  ),
                  RoundedButton(
                    text: "CIVIL ENGINEERING",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.pushNamed(context, 'teacher_list',
                          arguments: {"dep": "CIVIL ENGINEERING",
                            "code": "101"});
                    },
                  ),
                  RoundedButton(
                    text: "CSE",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.pushNamed(context, 'teacher_list',
                          arguments: {"dep": "CSE"});
                    },
                  ),
                  RoundedButton(
                    text: "LAW",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.pushNamed(context, 'teacher_list',
                          arguments: {"dep": "LAW"});
                    },
                  ),
                  RoundedButton(
                    text: "MECHANICAL ENGINEERING",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.pushNamed(context, 'teacher_list',
                          arguments: {"dep": "MECHANICAL ENGINEERING"});
                    },
                  ),
                  SizedBox(height: size.height * 0.03)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
