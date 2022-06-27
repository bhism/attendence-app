import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController name = TextEditingController();
  TextEditingController div = TextEditingController();
  TextEditingController rolln = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  var ww = '1A';
  var options = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  var _currentItemSelected = "1";
  var rool = "1";

  var options1 = [
    'A',
    'B',
  ];
  var _currentItemSelected1 = "A";
  var rool1 = "A";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a student'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                textAlign: TextAlign.center,
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                textAlign: TextAlign.center,
                controller: rolln,
                decoration: InputDecoration(
                  hintText: 'Roll Number',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Class : '),
                    DropdownButton<String>(
                      dropdownColor: Color.fromARGB(255, 0, 255, 21),
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: Color.fromARGB(255, 1, 1, 255),
                      focusColor: Color.fromARGB(255, 0, 17, 251),
                      items: options.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected) {
                        setState(() {
                          _currentItemSelected = newValueSelected!;
                          rool = newValueSelected;

                          ww = '';
                          ww = _currentItemSelected + _currentItemSelected1;
                        });
                        print(ww);
                      },
                      value: _currentItemSelected,
                    ),
                  ],
                ),
                SizedBox(
                  width: 35,
                ),
                Row(
                  children: [
                    Text('Div : '),
                    DropdownButton<String>(
                      dropdownColor: Color.fromARGB(255, 26, 255, 0),
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: Colors.blue[900],
                      focusColor: Colors.blue[900],
                      items: options1.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected1) {
                        setState(() {
                          _currentItemSelected1 = newValueSelected1!;
                          rool1 = newValueSelected1;
                          ww = '';
                          ww = _currentItemSelected + _currentItemSelected1;
                        });
                        print(ww);
                      },
                      value: _currentItemSelected1,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Color.fromARGB(255, 2, 11, 128),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                ref.add({
                  'name': name.text,
                  'div': ww,
                  'roll': rolln.text,
                }).whenComplete(() {
                  Fluttertoast.showToast(
                    msg: "added",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                });
              },
              child: Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
