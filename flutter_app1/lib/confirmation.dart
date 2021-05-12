import 'package:flutter/material.dart';
//import 'notification.dart';
//import 'sos-popup-screen.dart';
import 'dashboard.dart';

class confirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: (
            IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => notification()),
                );
              },
            )
        ),*/
        title: Text(
            'Confirmation',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(15,20,15,10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
           SizedBox(height:80),
            Container(
              width: 300,
              height: 300,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/may_tan.png'),
                ),
              ),
            ),
           /* Container(
              padding: EdgeInsets.fromLTRB(40, 50, 0, 30),
              child: Image.asset('images/may_tan.png', height: 300, width: 300, fit: BoxFit.fill,
              //AssetImage('images/may_tan.png',// height: 300, width: 300, fit: BoxFit.fill,
              ),
            ),*/
            SizedBox(height:50),
            Center(
              child: Container(
               // padding: EdgeInsets.fromLTRB(40, 0, 0, 30),
                child: Text(
                  'May Tan',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height:50),
            Center(
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Not your senior?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey,
                    decoration: TextDecoration.underline,
                  ),
                ),
                //padding: EdgeInsets.fromLTRB(40, 50, 0, 30),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar:  Container(
        height: 40,
        //width: 56,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),//MyHomePage()),
            );
          },
          child: Text(
              'CONTINUE',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              )
          ),
          padding: EdgeInsets.fromLTRB(60,0,60,0),
          color: Colors.red,
        ),
      ),

    );
  }
}