import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import './widget/input.dart';

// import 'package:http/http.dart' as http;
// import 'package:sizer/sizer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(32, 33, 37, 1),
    ));

    return MaterialApp(
      title: 'Bomber',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(32, 33, 37, 1),
          title: Text(
            "Prank Bomber",
            style: TextStyle(
              fontFamily: 'GoogleSans',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(32, 33, 37, 1),
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              color: Colors.amber,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  " Note - This app is for only education purpose only,\n Don't use it for revenge use it for fun, \n I do not take any responsibility. \n If you are facing any error contact Developer",
                  style: TextStyle(
                      fontFamily: 'GooogleSans',
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
            InputFields(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      'Github',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'GoogleSans',
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      padding: EdgeInsets.all(20),
                    ),
                    onPressed: _launchURL,
                  ),
                  ElevatedButton(
                    child: Text(
                      'Developer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'GoogleSans',
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      primary: Color.fromRGBO(30, 30, 30, 150),
                      elevation: 10,
                      padding: EdgeInsets.all(20),
                    ),
                    onPressed: _openGit,
                  ),
                ],
              ),
            ),
            // Card(
            //   shape: StadiumBorder(
            //     side: BorderSide(
            //       color: Colors.amber,
            //       width: 2.0,
            //     ),
            //   ),
            //   elevation: 10,
            //   child: Container(
            //     padding: EdgeInsets.all(10),
            //     child: Text(
            //       ' Contant Us at devnirwal16@gmail.com ',
            //       style: TextStyle(
            //         fontSize: 25,
            //         fontFamily: 'GoogleSans',
            //       ),
            //     ),
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     elevation: 10,
            //     primary: Colors.amber,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15.0),
            //     ),
            //   ),
            //   child: Text('Safe my number'),
            // )
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = "https://github.com/devn913/bomber_app";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_openGit() async {
  const url = "https://github.com/devn913";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
