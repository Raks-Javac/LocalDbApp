import 'package:flutter/material.dart';

import 'package:sqliteapp/src/db/DatabaseHelper.dart';

class TestHome extends StatefulWidget {
  TestHome({Key key}) : super(key: key);

  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  String userName = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Db App"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("$email,$userName,$password"),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.text,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: "",
                  border: OutlineInputBorder(),
                ),
                onChanged: (String val) {
                  setState(() {
                    userName = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),

              ///
              ///
              ///
              ///
              ///

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.text,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: "",
                  border: OutlineInputBorder(),
                ),
                onChanged: (String val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),

              ///
              ///
              ///
              ///
              ///
              ///

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.text,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: "",
                  border: OutlineInputBorder(),
                ),
                onChanged: (String val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),

              ///
              ///
              ///
              ///
              ///
              ///
              ///
              Row(
                children: [
                  MaterialButton(
                    color: Colors.blue[300],
                    textColor: Colors.white,
                    onPressed: () async {
                      int i = await DataBaseHelper.instance.insert({
                        DataBaseHelper.columnName: userName,
                        DataBaseHelper.columnEmail: email,
                        DataBaseHelper.columnPassword: password,
                      });
                      print(i);
                    },
                    child: Text("insert"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  MaterialButton(
                    color: Colors.green[200],
                    onPressed: () async {
                      int i = await DataBaseHelper.instance.update({
                        DataBaseHelper.columnName: userName,
                        DataBaseHelper.columnEmail: email,
                        DataBaseHelper.columnPassword: password,
                      });
                      print(i);
                    },
                    child: Text("update"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),

              Row(
                children: [
                  MaterialButton(
                    color: Colors.red[300],
                    textColor: Colors.white,
                    onPressed: () async {
                      // await DataBaseHelper.instance.delete(1);
                      await DataBaseHelper.instance.deleteUsername(userName);
                    },
                    child: Text("delete"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.purple[300],
                    onPressed: () async {
                      List<Map<String, dynamic>> queryAll =
                          await DataBaseHelper.instance.queryAll();
                      print(queryAll);
                    },
                    child: Text("get"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
