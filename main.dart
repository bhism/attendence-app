import 'package:attendemce/add.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'mainpage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyCXgBJYEqzU163gcfH8_v-0ySEuSxYX12Y",
  //       authDomain: "attaand-19a30.firebaseapp.com",
  //       projectId: "attaand-19a30",
  //       storageBucket: "attaand-19a30.appspot.com",
  //       messagingSenderId: "1085631263056",
  //       appId: "1:1085631263056:web:4896cf4e6b4dc92fc87c55",
  //       measurementId: "G-YWCPG6HFHR",
  //     ),
  //   );
  // } else {
    await Firebase.initializeApp();
  // }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance app',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              // height: 50,
              // width: w,
              child: MaterialButton(
                color: Color.fromARGB(255, 2, 0, 133),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mainpage(),
                    ),
                  );
                },
                child: Text(
                  'Attendance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              // height: 50,
              // width: w,
              child: MaterialButton(
                color: Color.fromARGB(255, 2, 0, 133),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => add(),
                    ),
                  );
                },
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
