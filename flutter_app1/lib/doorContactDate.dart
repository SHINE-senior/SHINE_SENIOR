import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
//import 'doorContact.dart';
import 'dashboard.dart';
import 'doorContactData.dart';
import 'doorContactHistory.dart';


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

Card incident_done(){
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

Card normal(door){
  print('entered normal');
  return Card(
    child:Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightGreenAccent[100],
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        door,
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

Card timing(tim){
  return Card(
    child:Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        tim,
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
  return (
      SizedBox(
        height: 70,
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: timing(dates_times[0].time),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: //normal(dates_times[0].location,dates_times[0].time),
              (((double.parse(dates_times[0].time.split(' ')[0])-double.parse(dates_times[1].time.split(' ')[0])).abs()>=4)
                  ?(incident_done())
                  :(normal(dates_times[0].door)))
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
          startChild: timing(dates_times[dates_times.length-1].time),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: (normal(dates_times[dates_times.length-1].door))
          ),
          isLast: true,
        ),
      )
  );
}



Column date_timeline(calender_index) {
  List dates_times;
  switch (calender_index) {
    case 0:
      dates_times = date_01_01_2021;
      break;
    case 1:
      dates_times = date_02_01_2021;
      break;
    case 2:
      dates_times = date_03_01_2021;
      break;
    case 3:
      dates_times = date_04_01_2021;
      break;
    default:
      dates_times = date_01_01_2021;
  };
  var counting = 1;
  var mytime = dates_times[counting].time;

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
                          (((double.parse(mydata.time.split(' ')[0])-double.parse(mytime.split(' ')[0]))).abs()>=4)
                              ?(incident_done())
                              : (normal(mydata.door)),
                        ),
                      )
                  ));

            }
          }
          ).toList() ,
        ),
      ]
  )
  );

}


class doorContactDate extends StatefulWidget {
  @override
  _doorContactDateState createState() => _doorContactDateState();
}

class _doorContactDateState extends State<doorContactDate> {

  var dates =[
    '01-Jan-21','02-Jan-21','03-Jan-21','04-Jan-21'
  ];
  var calender_index=0;

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
                    MaterialPageRoute(builder: (context) => doorContactHistory()),
                  );
                },
              )
          ),
          title:Text(
              'Door Contact',
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
