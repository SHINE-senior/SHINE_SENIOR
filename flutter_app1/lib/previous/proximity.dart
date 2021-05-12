import 'package:flutter/material.dart';
import 'today_timeline.dart';
import 'yesterday_timeline.dart';
import 'proximityHistory.dart';
import 'dashboard.dart';
//import 'sos-popup-screen.dart';
//import 'notification.dart';


Row index(){
  return (Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.circle, color: Colors.lightGreenAccent[100]),
      Text('Normal'),
      Icon(Icons.circle, color: Colors.amber[200]),
      Text('Need Attention'),
      Icon(Icons.circle, color: Colors.red[200]),
      Text('Incident'),
    ],
  ));
}


switch_timeline(dropdown,counter) {
  return(
      (dropdown=='Today')?(today_timeline(counter)):(yesterday_timeline(counter))
  );
}


class proximity extends StatefulWidget {
  @override
  _proximityState createState() => _proximityState();
}

class _proximityState extends State<proximity> {

  String dropdown = 'Today';
  List listItem = ['Today','Yesterday'];
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (
            IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),//MyHomePage()),
                );
              },
            )
        ),
        title:Text(
                    'Proximity',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                ),
        actions: [IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.red,
            size: 35,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),//MyHomePage()),
            );
          },
        )],

        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(15,15,15,10),
        child: ListView(
            children: [Column(
              children: [
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(left:20,right:20),
                  child: DropdownButton(
                    value: dropdown,
                    dropdownColor: Colors.red,
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (newval) {
                      setState(() {
                        dropdown = newval;
                      });
                    },
                    items: listItem.map((valueitem) {
                      return DropdownMenuItem(
                        value: valueitem,
                        child: Text(
                            valueitem,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            )
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                        decoration: new BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              //maxInactive(),
                              Text(
                                'No. of Hours'
                              ),
                              Text(
                                  'Maximum Inactive',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  )
                              ),
                            ],
                          ),
                        )
                    ),
                    Container(
                      height: 70,
                        decoration: new BoxDecoration(
                          color: Colors.lightGreenAccent[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              //washroomVisits(),
                              Text(
                                'No. of Visits'
                              ),
                              Text(
                                  'Washroom Visits',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  )
                              ),
                            ],
                          ),
                        )
                    ),
                  ]
                ),
                SizedBox(height:20),
                index(),
                SizedBox(height: 10,),
                switch_timeline(dropdown,counter),
              ],
            ),]
        ),
      ),
      bottomNavigationBar:  Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => proximity_history()),      //MyHomePage()),
            );
          },
          child: Text(
              'HISTORY',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              )
          ),

          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.red),
              borderRadius: new BorderRadius.circular(20.0)
          ),

        ),
      ),
    );
  }
}
