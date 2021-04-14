import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'sos-popup-screen.dart';


class time_temp{
  String time;
  String temperature;

  time_temp({this.time,this.temperature});
}

List<time_temp> today = [
  time_temp(temperature:'38 C', time:'6.00 pm'),
  time_temp(temperature:'37.6 C', time:'4.00 pm'),
  time_temp(temperature:'37.1 C', time:'2.00 pm'),
  time_temp(temperature:'37 C', time:'12.00 pm'),
  time_temp(temperature:'37.5 C', time:'10.00 am'),
  time_temp(temperature:'36.9 C', time:'8.00 am')
];


Widget myfunc(String time,String temp) {

  Card fever(temp){
   return Card(
     child: Container(
       decoration: new BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: Colors.red[200],
       ),
       padding: EdgeInsets.all(8.0),
       child: Text(
         temp,
         textAlign: TextAlign.center,
         style: TextStyle(
           //backgroundColor: Colors.red,
           color: Colors.black,
           fontSize: 17,
         ),
       ),
     ),
   );
 }

 Card risky(temp){
   return Card(
     child: Container(
       decoration: new BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: Colors.amber[200],
       ),
       padding: EdgeInsets.all(8.0),
       child: Text(
         temp,
         textAlign: TextAlign.center,
         style: TextStyle(
           //backgroundColor: Colors.amber,
           color: Colors.black,
           fontSize: 17,
         ),
       ),
     ),
   );
 }

 Card normal(temp){
   return Card(
     child: Container(
       decoration: new BoxDecoration(
         borderRadius: BorderRadius.circular(10),
       ),
       padding: EdgeInsets.all(8.0),
       child: Text(
         temp,
         textAlign: TextAlign.center,
         style: TextStyle(
           //backgroundColor: Colors.red,
           color: Colors.black,
           fontSize: 17,
         ),
       ),
     ),
   );
 }

  return(SizedBox(
    height: 70,
    child: TimelineTile(
      alignment: TimelineAlign.center,
      //lineXY: 0.3,
      startChild: Card(
        child: Text(
          time,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.fromLTRB(20,0,0,0),
        child: (temp.compareTo('37.7')>0)
                 ?(fever(temp))
                 :((temp.compareTo('37.4')>0)
                    ?(risky(temp))
                    :(normal(temp)))
      ),
      //isFirst: true,
    ),
  )
  );
}


Row index(){
  return (Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.circle, color: Colors.grey),
      Text('Normal(36.5-37.4)'),
      Icon(Icons.circle, color: Colors.amber[200]),
      Text('Risky(37.5-37.6)'),
      Icon(Icons.circle, color: Colors.red[200]),
      Text('Fever(>37.6)'),
    ],
  ));
}


class body_temp extends StatefulWidget {
  @override
  _body_tempState createState() => _body_tempState();
}

class _body_tempState extends State<body_temp> {

  String dropdown = 'Today';
  List listItem = ['Today','Yesterday'];

  //var _controller= ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: (
              IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              )
          ),
          title: Text(
                'Body Temperature',
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
        padding: const EdgeInsets.fromLTRB(15,15,15,10),
        child: ListView(
            shrinkWrap: true,
          children: [Column(
            children: [
              /*Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Center(
                    child: Text(
                            'Body Temperature',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            )
                    ),
                  ),
                ],
              ),*/
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
              Center(
                child: Container(
                    width: 200,
                    height: 70,
                    decoration: new BoxDecoration(
                        color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: Center(
                      child: Text(
                        'Highest: 38 C',
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      )
                    ),
                  )
                ),
              ),
              SizedBox(height:20),
              index(),
              SizedBox(height: 30,),

              Column(
                  //controller: _controller,
                  children: today.map((timetemp) => myfunc(timetemp.time,timetemp.temperature)).toList()
              ),


              SizedBox(height: 50),
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
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
              child: Text(
                    'HISTORY',
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
