import 'package:flutter/material.dart';
import 'dashboard.dart';

class subscriptionModel extends StatefulWidget {
  @override
  _subscriptionModelState createState() => _subscriptionModelState();
}

class _subscriptionModelState extends State<subscriptionModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: Text(
                  'Subscription Model',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )
              )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Image.asset('images/subscription_model.PNG', height: 350, width: 380, fit: BoxFit.fill,
            ),
          ),
          Container(
              height: 50
          ),


          FlatButton(
            onPressed: () {},
            child: Text(
              'Where can I find more information about this?',
              style: TextStyle(
                fontSize: 17,
                color: Colors.blueGrey,
                decoration: TextDecoration.underline,
              ),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
