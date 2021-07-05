import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherList extends StatefulWidget {
  const TeacherList({Key key}) : super(key: key);

  @override
  _TeacherListState createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  @override
  void initState() {
    super.initState();
  }

  final String apiUrl = "https://razipublications.org/api/userlists2";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    final  Map<String, Object> dep = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('TEACHERS LIST'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mobile = snapshot.data[index]['mobile'];
                    if (snapshot.data[index]['dep'] == dep['dep']) {
                      print(dep['dep']);
                      return Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                                title: Text(snapshot.data[index]['name']),
                                subtitle: Text('Mobile: ' + snapshot.data[index]['mobile'] + '\n' 'FB: ' + snapshot.data[index]['fb']),
                                trailing: Text(snapshot.data[index]['blood']),
                              onTap: () {
                                launch(('tel://$mobile'));
                              },
                            )
                          ],
                        ),
                      );
                    } else {
                      return SizedBox(height: 0,);
                    }
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
