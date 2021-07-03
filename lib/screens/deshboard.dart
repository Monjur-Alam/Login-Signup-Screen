import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/screens/WebViewExample.dart';
import 'package:flutter_auth/screens/login_screen.dart';
import 'package:flutter_auth/screens/prosason.dart';
import 'package:flutter_auth/screens/student_department.dart';
import 'package:flutter_auth/screens/teacher_department.dart';
import 'package:flutter_auth/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sonargaon University')),
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
                    text: "TEACHER LIST",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TeacherDepartment();
                      }));
                    },
                  ),
                  RoundedButton(
                    text: "STUDENT LIST",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StudentDepartment();
                      }));
                    },
                  ),
                  RoundedButton(
                    text: "ADMINISTRATION",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Prosason();
                      }));
                    },
                  ),
                  RoundedButton(
                    text: "SONARGAON ERP",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WebViewExample();
                      }));
                    },
                  ),
                  RoundedButton(
                    text: "LOG OUT",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Logout'),
                                content: Text('Are you sure want to logout?'),
                                actions: [
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Yes'),
                                    onPressed: () async {
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.remove('mobile');
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ],
                              ));
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
