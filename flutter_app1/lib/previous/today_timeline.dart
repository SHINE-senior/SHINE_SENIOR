import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class time_loc{
  String time;
  String location;

  time_loc({this.time,this.location});
}

List<time_loc> today = [
  time_loc(location:'Kitchen', time:'6.00 pm'),
  time_loc(location:'Living', time:'2.00 pm'),
  time_loc(location:'Washroom', time:'2.00 pm'),
  time_loc(location:'Bedroom', time:'12.00 pm'),
  time_loc(location:'Living', time:'10.30 am'),
  time_loc(location:'Bedroom', time:'8.00 am')
];

List sub_today = today.sublist(1, today.length-1);

//int counter = 1;
int total = today.length; //6




Card incident_alert(loc){
  return Card(
    child: Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red[200],
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Alarm Raised',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    ), //Container
  );
}

Card incident_done(loc){
  return Card(
    child: Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Inactive',
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
              today[0].time,
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
              (((double.parse(today[0].time.split(' ')[0])-double.parse(today[1].time.split(' ')[0])).abs()>=3)
                  ?(incident_alert(today[0].location))
                  :(((double.parse(today[0].time.split(' ')[0])-double.parse(today[1].time.split(' ')[0]))).abs()>2)
                  ?(risky(today[0].location))
                  :(normal(today[0].location)))
          ),

          afterLineStyle:
          ((double.parse(today[0].time.split(' ')[0])-double.parse(today[1].time.split(' ')[0])).abs()>=3)
              ?LineStyle(color: Colors.red[200])
              :(((double.parse(today[0].time.split(' ')[0])-double.parse(today[1].time.split(' ')[0]))).abs()>2)
              ?LineStyle(color: Colors.amber[200])
              :LineStyle(color: Colors.grey),

          indicatorStyle:
          ((double.parse(today[0].time.split(' ')[0])-double.parse(today[1].time.split(' ')[0])).abs()>=3)
              ?IndicatorStyle(
            color: Colors.red[200],
            width: 25,
          )
              :(((double.parse(today[0].time.split(' ')[0])-double.parse(today[1].time.split(' ')[0]))).abs()>2)
              ?IndicatorStyle(
            color: Colors.amber[200],
            width: 25,
          )
              :IndicatorStyle(
            color: Colors.grey,
            width: 25,
          ),

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
              today[today.length-1].time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: (normal(today[today.length-1].location))

          ),

/*
          beforeLineStyle:
          ((double.parse(today[today.length-2].time.split(' ')[0])-double.parse(today[today.length-1].time.split(' ')[0])).abs()>=3)
              ?LineStyle(
            color: Colors.grey,
          )
              :(((double.parse(today[today.length-2].time.split(' ')[0])-double.parse(today[today.length-1].time.split(' ')[0]))).abs()>2)
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
          child: normal(loc),
/*          (((double.parse(today[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>=3)
              ?(incident_done(loc))
              :(((double.parse(today[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>2)
              ?(risky(loc))
              :(normal(loc))),*/
/*
      beforeLineStyle:
      (((double.parse(today[counter-2].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>=3)
          ?LineStyle(
        color: Colors.grey,
      )
          :(((double.parse(today[counter-2].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>2)
          ?LineStyle(
        color: Colors.amber[200],
      )
          :LineStyle(
        color: Colors.grey,
      ),


      afterLineStyle: (((double.parse(today[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>=3)
          ?LineStyle(
        color: Colors.grey,
      )
          :(((double.parse(today[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>2)
          ?LineStyle(
        color: Colors.amber[200],
      )
          :LineStyle(
        color: Colors.grey,
      ),


      indicatorStyle: (((double.parse(today[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>=3)
          ?IndicatorStyle(
        color: Colors.grey,
        width: 25,
      )
          :(((double.parse(today[counter].time.split(' ')[0])-double.parse(time.split(' ')[0]))).abs()>2)
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
  ) );//extra bracket
}



maxInactive(){
  var diff;
  var maximum = ((double.parse(today[0].time.split(' ')[0])-double.parse(today[1].time.split(' ')[0])).abs());
  for (var i=0;i<today.length-1;i++){
    diff = ((double.parse(today[i].time.split(' ')[0])-double.parse(today[i+1].time.split(' ')[0])).abs());
    if (maximum<diff){
      maximum=diff;
     // print(maximum);
    }
  }
  return(
      Text(
      '${maximum}',
        style: TextStyle(
          fontSize: 20,
        ),
      ));
}



washroomVisits(){
  var count=0;
  for (var i=0;i<today.length;i++){
    //diff = ((double.parse(today[i].time.split(' ')[0])-double.parse(today[i+1].time.split(' ')[0])).abs());
    if (today[i].location=='Washroom'){
      count++;
    }
  }
  return(
      Text(
          '${count}',
        style: TextStyle(
          fontSize: 20,
        ),
      ));
}


Column today_timeline(counter) {
  return (Column(
      children: [
        firstchild_timetime(),
        Column(
            children: sub_today.map((timeloc) =>
                myfunc(timeloc.time, timeloc.location, ++counter)).toList()
        ),
        lastchild_timetime(),
      ]
  )

  );
}

