import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dashboard.dart';

class profile_Page extends StatefulWidget {
  @override
  _profile_PageState createState() => _profile_PageState();
}

class _profile_PageState extends State<profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(246, 0, 0, 0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [

                Container(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 40
                      ),
                    ),

                    Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Text(
                            'My Profile',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            )
                        )
                    ),

                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 40
                      ),
                    ),
                  ],
                ),

                Column(
                  children:[
                    Image.asset('', height: 120, width: 120,
                    ),
                    Text(
                      'Tara Lee',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text('Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                              )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0,10,200,10),
            child: Text(
              'My Senior',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          Container(
            height: 130,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 246, 246),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Image.asset('images/may_tan.png', height: 100, width: 100,
                ),
                Container(

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'May Tan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Age: 68',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '+65 1234 9876',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ]
                    )
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0,10,120,10),
            child: Text(
              'My Subscription plan',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          Container(
            height: 130,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 246, 246),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Text(
                  'Wellness Monitoring (All In)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check,
                            size: 15,
                          ),
                          Text('Movement tracking',
                              style: TextStyle(
                                fontSize: 15,
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check,
                            size: 15,
                          ),
                          Text('Fall prediction',
                              style: TextStyle(
                                fontSize: 15,
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check,
                            size: 15,
                          ),
                          Text('Indoor location tracker',
                              style: TextStyle(
                                fontSize: 15,
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check,
                            size: 15,
                          ),
                          Text('Door contact',
                              style: TextStyle(
                                fontSize: 15,
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check,
                            size: 15,
                          ),
                          Text('Live security footage',
                              style: TextStyle(
                                fontSize: 15,
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                      Icons.article,
                      size: 40
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  child: Icon(
                      Icons.home,
                      size: 40
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                      Icons.person,
                      size: 40
                  ),
                ),
              ]
          )
        ],
      ),
    );
  }
}
