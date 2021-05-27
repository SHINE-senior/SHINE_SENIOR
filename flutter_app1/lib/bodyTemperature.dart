import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'bodyTemperatureData.dart';


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


Card incident_alert(){
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

Card normal(temp){
  return Card(
    child:Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightGreenAccent[100],
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        temp,
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


SizedBox firstChildToday(latestReadTime,latestReadTemperature){
  return (
      SizedBox(
        height: 70,
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: timing(latestReadTime),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: //normal(dates_times[0].location,dates_times[0].time),
              ((latestReadTemperature.compareTo('37.5')>0)
                  ?(incident_alert())
                  :((latestReadTemperature.compareTo('37.0')>0)
                  ?(risky(latestReadTemperature))
                  :(normal(latestReadTemperature))))
          ),
          isFirst: true,
        ),
      )
  );
}


SizedBox firstChildYesterday(latestReadTime,latestReadTemperature){
  return (
      SizedBox(
        height: 70,
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: timing(latestReadTime),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: //normal(dates_times[0].location,dates_times[0].time),
              ((latestReadTemperature.compareTo('37.5')>0)
                  ?(incident_done())
                  :(normal(latestReadTemperature)))
          ),
          isFirst: true,
        ),
      )
  );
}


SizedBox lastChild(oldestDataTime,oldestDataTemperature) {
  return (
      SizedBox(
        height: 70,
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: timing(oldestDataTime),
          endChild: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: (oldestDataTemperature.compareTo('37.5')>0)
                  ?(incident_done())
                  : (normal(oldestDataTemperature)),
          ),
          isLast: true,
        ),
      )
  );
}



switch_timeline(dropdown) {
  List day;
  double max_temp=0;
  var current;
  switch(dropdown){
    case 'Today': day=today;
    //print(double.parse(day[0].temperature.split(' ')[0]));
    for(int i=0;i<day.length-1;i++){
      //print(double.parse(day[i].temperature.split(' ')[0]));
      current = double.parse(day[i].temperature.split(' ')[0]);
      if(current>max_temp){
        max_temp=current;
      }
    }
    break;

    case 'Yesterday': day=yesterday;
    for(int i=0;i<day.length-1;i++){
      current = double.parse(day[i].temperature.split(' ')[0]);
      if(current>max_temp){
        max_temp=current;
      }
    }
    break;
    default: day=today;
  };

  return(Column(
      children: [
        Center(
          child: Container(
              width: 200,
              height: 70,
              decoration: new BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Highest: ',
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    Text(
                        '${max_temp}',
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                  ],
                )
              )
          ),
        ),
        SizedBox(height:20),
        ((dropdown=='Today')
            ?(index_today())
            :(index_yesterday())),
        SizedBox(height:10),

        Column(
          children:
            day.map((tempData) {
              if(tempData.time==day[0].time) {
                if(dropdown=='Today'){
                  return (firstChildToday(tempData.time, tempData.temperature));
                }
                else {
                  return (firstChildYesterday(tempData.time, tempData.temperature));
                }
              }
              else if (tempData.time==day[day.length-1].time){
                return(lastChild(day[day.length-1].time,day[day.length-1].temperature));
              }
              else{
                return(SizedBox(
                    height: 70,
                    child: TimelineTile(
                      alignment: TimelineAlign.center,
                      startChild: timing(tempData.time),
                        endChild: Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,0,0),
                          child:
                          (tempData.temperature.compareTo('37.5')>0)
                            ?(incident_done())
                              : (normal(tempData.temperature)),
                        ),
                    )
                ));
              }
            }).toList()
        ),

      ]
  )
  );

}



class bodyTemperature extends StatefulWidget {
  @override
  _bodyTemperatureState createState() => _bodyTemperatureState();
}

class _bodyTemperatureState extends State<bodyTemperature> {

  String dropdown = 'Today';
  List listItem = ['Today','Yesterday'];

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
            'Body Temperature',
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
              ]
            )
            ]
        ),
      ),

      bottomNavigationBar:  Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),      //MyHomePage()),
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
