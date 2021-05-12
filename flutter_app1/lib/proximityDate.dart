import 'package:flutter/material.dart';
import 'proximityHistory.dart';
//import 'sos-popup-screen.dart';
import 'dashboard.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'proximityData.dart';


Row index(){
  return (Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.circle, color: Colors.lightGreenAccent[100]),
      Text('Normal'),
      SizedBox(width: 20),
      Icon(Icons.circle, color: Colors.grey),
      Text('Incident'),
    ],
  ));
}


Card incident_done(loc){
  //mytime = tim;
  return Card(
    child: Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Incident',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    ), //Container
  );
}

Card normal(loc){
  //mytime = tim;
  print('entered normal');
  return Card(
    child:Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightGreenAccent[100],
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        loc,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    ),
    //Container
  );
}


SizedBox firstChild(dates_times){
  //print('entered firstChild');
  return (
      SizedBox(
        height: 70,
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: Card(
            child: Text(
              dates_times[0].time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: //normal(dates_times[0].location,dates_times[0].time),
              (((double.parse(dates_times[0].time.split(' ')[0])-double.parse(dates_times[1].time.split(' ')[0])).abs()>=3)
                  ?(incident_done(dates_times[0].location))
                  :(normal(dates_times[0].location)))
          ),


          isFirst: true,
        ),
      )
  );
}


SizedBox lastChild(dates_times) {
  return (
      SizedBox(
        height: 70,
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: Card(
            child: Text(
              dates_times[dates_times.length-1].time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: (normal(dates_times[dates_times.length-1].location))
          ),

          isLast: true,
        ),
      )
  );
}




Column date_timeline(calender_index) {
  List dates_times;
  switch(calender_index){
    case 0: dates_times=date_01_01_2021;
    break;
    case 1: dates_times=date_02_01_2021;
    break;
    case 2: dates_times=date_03_01_2021;
    break;
    case 3: dates_times=date_04_01_2021;
    break;
    default: dates_times=date_01_01_2021;
  };
  var counting=1;
  var mytime=dates_times[counting].time;
  //print(dates_times[0].time);
  return (Column(
      children: [
        //firstChild(dates_times),
        /*Column(
            children: date_01_01_2021.map((timeloc) =>
                midChildren(timeloc.time, timeloc.location)).toList()
        ),*/
        Column(
          children:
            //sub_date_01_01_2021.map((mydata)=>
            dates_times.map((mydata){
              //print(mydata.time);
              if (mydata.time==dates_times[0].time){
                return(firstChild(dates_times));
              }
              else if (mydata.time==dates_times[dates_times.length-1].time){
                return(lastChild(dates_times));
              }
              else {
                //print('hello');
                mytime=dates_times[++counting].time;
                return(
                SizedBox(
                    height: 70,
                    child: TimelineTile(
                      alignment: TimelineAlign.center,
                      startChild: Card(
                        child: Text(
                          '${mydata.time}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      endChild: Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: //normal(mydata.location,mydata.time),
                        (((double.parse(mydata.time.split(' ')[0])-double.parse(mytime.split(' ')[0]))).abs()>=3)
                            ?(incident_done(mydata.location))
                            : (normal(mydata.location)),
                      ),
                    )
                ));

              }
                /*SizedBox(
                    height: 70,
                    child: TimelineTile(
                      alignment: TimelineAlign.center,
                      startChild: Card(
                        child: Text(
                          '${mydata.time}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      endChild: Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: //normal(mydata.location)
                        (((double.parse(mydata.time.split(' ')[0])-double.parse(mytime.split(' ')[0]))).abs()>=3)
                            ?(incident_done(mydata.location,mydata.time))
                            : (normal(mydata.location,mydata.time)),
                      ),
                    )
                );*/
            }
            ).toList() ,
        ),

        //lastChild(dates_times),
      ]
  )
  );
}


/*Container date_container(calender_index){
  return(
      Container(
        padding: EdgeInsets.fromLTRB(0,16,0,0),
        child: Text(
            dates[calender_index],
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              //backgroundColor: Colors.blue,
              //color: Colors.black,
            )
        ),
      )
  );
}*/


class date_proximity extends StatefulWidget {
   String value;
   String months;

  // receive data from the FirstScreen as a parameter
  date_proximity({this.value,this.months});
  @override
  _date_proximityState createState() => _date_proximityState(value,months);
}

class _date_proximityState extends State<date_proximity> {
  String value;
  String months;
  _date_proximityState(this.value,this.months);

  var dates =[
    '01-Jan-21','02-Jan-21','03-Jan-21','04-Jan-21','05-Jan-21','06-Jan-21','07-Jan-21'
  ];
  var calender_index=0;

  @override
  Widget build(BuildContext context) {
  print(value);
  print(months);
    /*for (int i=0;i<dates.length;i++){
      print(calender_index);
      if (value!=dates[calender_index]){
        ++calender_index;
        print('hi');
      }
      else break;
    }*/

    return Scaffold(
      appBar: AppBar(
        leading: (
            IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => proximity_history()),
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
          children: [
            Column(
              children:[
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_left,
                        color: Colors.red,
                        size: 50,
                      ),
                      onPressed: () {
                        if (calender_index!=0){
                        setState(() {
                          --calender_index;
                        });}
                      },
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.fromLTRB(0,16,0,0),
                      child: Text(
                                dates[calender_index],
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  //backgroundColor: Colors.blue,
                                )
                            ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_right,
                        color: Colors.red,
                        size: 50,
                      ),
                      onPressed: () {
                        if (calender_index<6){
                          setState(() {
                            ++calender_index;
                          });}
                      },
                    ),
                  ]
                ),
                SizedBox(height: 20),
                index(),
                SizedBox(height: 20),
                date_timeline(calender_index),
              ]
            )
          ]
        ),
      ),
    );
  }
}
