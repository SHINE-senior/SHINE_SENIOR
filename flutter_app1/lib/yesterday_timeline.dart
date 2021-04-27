import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class time_loc{
  String time;
  String location;

  time_loc({this.time,this.location});
}

List<time_loc> yesterday = [
  time_loc(location:'Washroom', time:'5.00 pm'),
  time_loc(location:'Living', time:'3.00 pm'),
  time_loc(location:'Washroom', time:'1.30 pm'),
  //time_loc(location:'Bedroom', time:'12.00 pm'),
  time_loc(location:'Living', time:'9.00 am'),
  time_loc(location:'Bedroom', time:'7.00 am'),
  time_loc(location:'Bedroom', time:'5.00 am'),
  time_loc(location:'Living', time:'3.30 am'),
  time_loc(location:'Bedroom', time:'1.00 am')
];

List sub_yesterday = yesterday.sublist(1, yesterday.length-1);

//int counter = 1;
int total = yesterday.length; //6



Card incident_done(loc){
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


Card incident_alert(loc){
  return Card(
    child: Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red[200],
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
    ), //Container
  );
}


Card risky(loc){
  return Card(
    child: Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber[200],
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
    ),//Container
  );
}

Card normal(loc){
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


SizedBox firstchild_timetime(){
  return (
      SizedBox(
        height: 70,
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: Card(
            child: Text(
              yesterday[0].time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child:
              (((double.parse(yesterday[0].time.split(' ')[0])-double.parse(yesterday[1].time.split(' ')[0])).abs()>=3)
                  ?(incident_done(yesterday[0].location))
                  :(normal(yesterday[0].location)))
              /*
              (((double.parse(yesterday[0].time.split(' ')[0])-double.parse(yesterday[1].time.split(' ')[0]))).abs()>2)
                  ?(risky(yesterday[0].location))
                  :(normal(yesterday[0].location)))*/
          ),

  /*        afterLineStyle:
          ((double.parse(yesterday[0].time.split(' ')[0])-double.parse(yesterday[1].time.split(' ')[0])).abs()>=3)
              ?LineStyle(color: Colors.red[200])
              :(((double.parse(yesterday[0].time.split(' ')[0])-double.parse(yesterday[1].time.split(' ')[0]))).abs()>2)
              ?LineStyle(color: Colors.amber[200])
              :LineStyle(color: Colors.grey),

          indicatorStyle:
          ((double.parse(yesterday[0].time.split(' ')[0])-double.parse(yesterday[1].time.split(' ')[0])).abs()>=3)
              ?IndicatorStyle(
            color: Colors.red[200],
            width: 25,
          )
              :(((double.parse(yesterday[0].time.split(' ')[0])-double.parse(yesterday[1].time.split(' ')[0]))).abs()>2)
              ?IndicatorStyle(
            color: Colors.amber[200],
            width: 25,
          )
              :IndicatorStyle(
            color: Colors.grey,
            width: 25,
          ), */

          isFirst: true,
        ),
      )
  );
}


SizedBox lastchild_timetime() {
  return (
      SizedBox(
        height: 70,
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: Card(
            child: Text(
              yesterday[yesterday.length-1].time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: (normal(yesterday[yesterday.length-1].location))

          ),

/*
          beforeLineStyle:
          ((double.parse(yesterday[yesterday.length-2].time.split(' ')[0])-double.parse(yesterday[yesterday.length-1].time.split(' ')[0])).abs()>=3)
              ?LineStyle(
            color: Colors.red[200],
          )
              :(((double.parse(yesterday[yesterday.length-2].time.split(' ')[0])-double.parse(yesterday[yesterday.length-1].time.split(' ')[0]))).abs()>2)
              ?LineStyle(
            color: Colors.amber[200],
          )
              :LineStyle(
            color: Colors.grey,
          ),*/

          isLast: true,
        ),
      )
  );
}


Widget myfunc(String time,String loc, int counter) {
  return(SizedBox(
    height: 70,
    child: TimelineTile(
      alignment: TimelineAlign.center,
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
          child:
          (((double.parse(yesterday[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>=3)
              ?(incident_done(loc))
              : (normal(loc)),

          /*(((double.parse(yesterday[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>2)
              ?(risky(loc))
              :(normal(loc))),*/
/*
      beforeLineStyle:
      (((double.parse(yesterday[counter-2].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>=3)
          ?LineStyle(
        color: Colors.red[200],
      )
          :(((double.parse(yesterday[counter-2].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>2)
          ?LineStyle(
        color: Colors.amber[200],
      )
          :LineStyle(
        color: Colors.grey,
      ),


      afterLineStyle: (((double.parse(yesterday[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>=3)
          ?LineStyle(
        color: Colors.red[200],
      )
          :(((double.parse(yesterday[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>2)
          ?LineStyle(
        color: Colors.amber[200],
      )
          :LineStyle(
        color: Colors.grey,
      ),


      indicatorStyle: (((double.parse(yesterday[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>=3)
          ?IndicatorStyle(
        color: Colors.red[200],
        width: 25,
      )
          :(((double.parse(yesterday[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>2)
          ?IndicatorStyle(
        color: Colors.amber[200],
        width: 25,
      )
          :IndicatorStyle(
        color: Colors.grey,
        width: 25,
      ),*/

    ),
  )
  ) );
}


Column yesterday_timeline(counter) {
  return (Column(
      children: [
        firstchild_timetime(),
        Column(
            children: sub_yesterday.map((timeloc) =>
                myfunc(timeloc.time, timeloc.location, ++counter)).toList()
        ),
        lastchild_timetime(),
      ]
  )

  );
}

