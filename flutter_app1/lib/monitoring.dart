import 'package:flutter/material.dart';
import 'notification.dart';

class Monitoring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15,20,15,10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 120, 0, 0),
              child: Image.asset('images/monitoring.PNG', height: 300, width: 300, fit: BoxFit.fill,
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                'Monitoring',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                "Be able to care for your senior even when you are apart",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(130, 80, 0, 0),
                    width: 12.0,
                    height: 25.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 80, 130, 0),
                    width: 12.0,
                    height: 15.0,
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ]
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => notification()),
                  );
                },
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}