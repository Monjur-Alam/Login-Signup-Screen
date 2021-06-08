import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/deshboard.dart';
import 'package:flutter_auth/screens/login_screen.dart';
import 'package:flutter_auth/screens/student_list.dart';
import 'package:flutter_auth/screens/teacher_list.dart';
import 'package:flutter_auth/screens/welcome_screen.dart';
import 'package:flutter_auth/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var mobile = prefs.getString('mobile');
  runApp(MaterialApp(
      routes: {
        'teacher_list': (context) => TeacherList(),
        'student_list': (context) => StudentList(),
      },
      home: mobile == null ? LoginScreen() : Dashboard())
  );
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Auth',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white
//       ),
//       home: WelcomeScreen(),
//     );
//   }
// }
