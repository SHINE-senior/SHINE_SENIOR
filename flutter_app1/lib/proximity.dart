import 'package:flutter/material.dart';
import 'proximityHistory.dart';
import 'dashboard.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'proximityData.dart';


Row index_today(){
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

Row index_yesterday(){
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
              (((double.parse(dates_times[0].time.split(' ')[0])-double.parse(dates_times[1].time.split(' ')[0])).abs()>=3)
                  ?(incident_alert(dates_times[0].location))
                  :(((double.parse(dates_times[0].time.split(' ')[0])-double.parse(dates_times[1].time.split(' ')[0])).abs()>=3)
                    ?(risky(dates_times[0].location))
                    :(normal(dates_times[0].location))))
          ),

          /*
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
          */

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
              child: (normal(dates_times[dates_times.length-1].location))
          ),
          isLast: true,
        ),
      )
  );
}


switch_timeline(dropdown) {
  List day;
  double max_time=0;
  int visits=0;
  var temp;
  switch(dropdown){
    case 'Today': day=proximityToday;
                  for(int i=0;i<day.length-1;i++){
                    temp = (((double.parse(day[i].time.split(' ')[0])-double.parse(day[i+1].time.split(' ')[0]))).abs());
                    if(max_time < temp){
                      max_time=temp;
                    }
                  }
                  for(int i=0;i<day.length;i++){
                    if (day[i].location=='Washroom'){
                      ++visits;
                    }
                  }
                  break;
    case 'Yesterday': day=yesterday;
                      for(int i=0;i<day.length-1;i++){
                        temp = (((double.parse(yesterday[i].time.split(' ')[0])-double.parse(yesterday[i+1].time.split(' ')[0]))).abs());
                        if(max_time < temp){
                          max_time=temp;
                        }
                      }
                      for(int i=0;i<day.length;i++){
                        if (yesterday[i].location=='Washroom'){
                          ++visits;
                        }
                      }
                      break;
    default: day=proximityToday;
  };
  var counting=1;
  var mytime=day[counting].time;
  print(max_time);
  print(visits);
  return (Column(
      children: [

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
                            '${visits}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
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


        ((dropdown=='Today')
      ?(index_today())
      :(index_yesterday())),
        SizedBox(height:10),
        Column(
          children:
          day.map((mydata){
            if (mydata.time==day[0].time){
              return(firstChild(day));
            }
            else if (mydata.time==day[day.length-1].time){
              return(lastChild(day));
            }
            else {
              //print('hello');
              mytime=day[++counting].time;
              return(
                  SizedBox(
                      height: 70,
                      child: TimelineTile(
                        alignment: TimelineAlign.center,
                        startChild: timing(mydata.time),
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
          }
          ).toList() ,
        ),
      ]
  )
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
                switch_timeline(dropdown),
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
