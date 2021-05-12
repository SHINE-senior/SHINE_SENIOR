import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'statistics.dart';


class Welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child:
                Container(
                  height: 550.0,
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 175, 0, 0),
                          //padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Welcome!',
                              style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 10.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    )
                                  ]
                              )
                          ),
                        ),
                        Text(
                          'Caregiver Name',
                          style: TextStyle(
                            fontSize: 23.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
          SizedBox(height: 40),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Statistics()),
              );
            },
            child: Text(
              'NOK/Personal Caregiver',
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
            ),
            color: Colors.red,
            //padding: EdgeInsets.fromLTRB(52, 10, 52, 10),
            //color: Color.fromARGB(255, 193, 51, 43),
          ),
          SizedBox(height: 10),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Statistics()),
              );
            },
            child: Text(
              'Care Org/Volunteers',
              style: TextStyle(
                fontSize: 23,
                color: Colors.red,//fromARGB(255, 193, 51, 43),
              ),
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red),
                borderRadius: new BorderRadius.circular(20.0)
                //side: BorderSide(color: Color.fromARGB(255, 193, 51, 43),)
            ),
            //padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
            //color: Color.fromARGB(255, 246, 246, 246),
          ),
        ],
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path= new Path();
    path.lineTo(0,size.height);
    var controlPoint=Offset(0,size.height-100);
    var endPoint=Offset(size.width/2,size.height-120);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    var controlPoint1=Offset(size.width/2+140,size.height-120);
    var endPoint1=Offset(size.width,size.height-200);
    path.quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);

    //path.lineTo(size.width,size.height-100);
    path.lineTo(size.width,0);//size.height-100);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
