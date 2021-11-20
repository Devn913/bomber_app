import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

final TextEditingController mobile = new TextEditingController();
final TextEditingController sms = new TextEditingController();

class InputFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        color: Color.fromRGBO(30, 30, 30, 150),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.amber, width: 2.0)),
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: mobile,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(fontFamily: 'GoogleSans'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.amber, width: 2.0)),
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: sms,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Number of sms',
                    hintStyle: TextStyle(fontFamily: 'GoogleSans'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                ),
                child: Text(
                  'Send',
                  style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onPressed: _send,
              ),
            )
          ],
        ),
      ),
    );
  }
}

_send() async {
  var _mobile = mobile.text;
  var _sms = sms.text;

  var url = Uri.parse("https://bomberapi.herokuapp.com/bomb?number=" +
      _mobile +
      "&noOfMsg=" +
      _sms);
  var response = await http.get(url);
  final parsedJson = jsonDecode(response.body);
  Fluttertoast.showToast(
    msg: parsedJson['status'],
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
