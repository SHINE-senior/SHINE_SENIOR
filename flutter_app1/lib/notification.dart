import 'package:flutter/material.dart';
//import 'proximity.dart';
import 'confirmation.dart';
//import 'sos-popup-screen.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {

  String grpval1 = '';
  String grpval2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Notification',
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
        child: ListView(
            shrinkWrap: true,
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                    'Please confirm your phone number and emailid you would like to be contacted in case of emergency',
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
                SizedBox(height: 60),
                Text(
                    'Phone No.',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Number',
                        ),
                      )
                  ),
                ),
                SizedBox(height: 40),
                Text(
                    'Email ID',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
                SizedBox(height: 15),
                Center(
                  child: Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Email',
                        ),
                      )
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Text(
                            'Contacted by SMS?',
                            style: TextStyle(
                              fontSize: 18,
                            )
                        )
                    ),
                    Radio(
                      value:'yes',
                      groupValue: grpval1,
                      activeColor: Colors.red,
                      onChanged: (val) {
                        grpval1=val;
                        setState(() {});
                      },
                    ),
                    Text('Yes'),
                    Radio(
                      value:'no',
                      groupValue: grpval1,
                      activeColor: Colors.red,
                      onChanged: (val) {
                        grpval1=val;
                        setState(() {});
                      },
                    ),
                    Text('No'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Text(
                            'Contacted by Email?',
                            style: TextStyle(
                              fontSize: 18,
                            )
                        )
                    ),
                    Radio(
                      value:'yes',
                      groupValue: grpval2,
                      activeColor: Colors.red,
                      onChanged: (val) {
                        grpval2=val;
                        setState(() {});
                      },
                    ),
                    Text('Yes'),
                    Radio(
                      value:'no',
                      groupValue: grpval2,
                      activeColor: Colors.red,
                      onChanged: (val) {
                        grpval2=val;
                        setState(() {});
                      },
                    ),
                    Text('No'),
                  ],
                ),
                SizedBox(height: 80),
              ],
            ),]
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
              MaterialPageRoute(builder: (context) =>  confirmation()),
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
