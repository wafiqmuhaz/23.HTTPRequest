import 'package:all/post_result_model.dart';
import "package:flutter/material.dart";

void main() {
  runApp(app());
}

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  // ignore: non_constant_identifier_names
  postResult PostResult = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("API DEMO"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // ignore: unnecessary_null_comparison
              Text((PostResult != null)
                  ? PostResult.id +
                      " | " +
                      PostResult.name +
                      " | " +
                      PostResult.job +
                      " | " +
                      PostResult.created
                  : "Data Tidak Ditemukan"),
              ElevatedButton(
                onPressed: () {
                  postResult
                      .connectKeAPI("Wafiq", "Programmer")
                      .then((value) => PostResult = value);
                  setState(() {});
                },
                child: Text("POST"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
