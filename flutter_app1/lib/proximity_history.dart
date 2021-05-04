import 'package:flutter/material.dart';
import 'proximity.dart';
//import 'notification.dart';
import 'dashboard.dart';

class history {
  String date;
  int max_inactive;
  int washroom;
  int incidents;

  history({this.date, this.max_inactive, this.washroom, this.incidents});
}

var january = <history>[
  history(date: '1-Jan-2021', max_inactive: 2, washroom: 2, incidents: 0),
  history(date: '2-Jan-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '3-Jan-2021', max_inactive: 4, washroom: 4, incidents: 1),
  history(date: '4-Jan-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '5-Jan-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '6-Jan-2021', max_inactive: 2, washroom: 3, incidents: 1),
  history(date: '7-Jan-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '8-Jan-2021', max_inactive: 2, washroom: 3, incidents: 1),
  history(date: '9-Jan-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '10-Jan-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '11-Jan-2021', max_inactive: 2, washroom: 3, incidents: 1),
];

var february = <history>[
  history(date: '1-Feb-2021', max_inactive: 2, washroom: 2, incidents: 0),
  history(date: '2-Feb-2021', max_inactive: 4, washroom: 3, incidents: 1),
  history(date: '3-Feb-2021', max_inactive: 2, washroom: 4, incidents: 0),
  history(date: '4-Feb-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '5-Feb-2021', max_inactive: 4, washroom: 3, incidents: 1),
  history(date: '6-Feb-2021', max_inactive: 2, washroom: 3, incidents: 1),
  history(date: '7-Feb-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '8-Feb-2021', max_inactive: 2, washroom: 3, incidents: 1),
  history(date: '9-Feb-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '10-Feb-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '11-Feb-2021', max_inactive: 2, washroom: 3, incidents: 1),
];

var march = <history>[
  history(date: '1-Mar-2021', max_inactive: 2, washroom: 2, incidents: 0),
  history(date: '2-Mar-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '3-Mar-2021', max_inactive: 4, washroom: 4, incidents: 1),
  history(date: '4-Mar-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '5-Mar-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '6-Mar-2021', max_inactive: 2, washroom: 3, incidents: 1),
  history(date: '7-Mar-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '8-Mar-2021', max_inactive: 2, washroom: 3, incidents: 1),
  history(date: '9-Mar-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '10-Mar-2021', max_inactive: 2, washroom: 3, incidents: 0),
  history(date: '11-Mar-2021', max_inactive: 2, washroom: 3, incidents: 1),
];

/*
Column other_func() {
  return (
        Column(
            children: january.map((data) =>
                myfunc(data.date, data.max_inactive, data.washroom,data.incidents)).toList()
        )
  );
}


Widget myfunc(String date, int max_inactive,int washroom,int incidents) {
  return(
    Container(
      child:
      DataTable(
          columns: [
            DataColumn(label: Text(
              'Date',
              textAlign: TextAlign.center,
            )),
            DataColumn(label: Text(
              'Max\nInactivity',
              textAlign: TextAlign.center,
            )),
            DataColumn(label: Text(
              'Washroom\nVists',
              textAlign: TextAlign.center,
            )),
            DataColumn(label: Text(
              'Incidents',
              textAlign: TextAlign.center,
            )),
          ],
         // rows: [ func()]
          rows:[
            january.map((data)=> DataRow(
              DataCell(Text(data.date)),
            )).toList()
          //january.map((data) =>
      //  DataRow(data.date, data.max_inactive, data.washroom,data.incidents)).toList()
  ]
            /*DataRow(
                cells: [
                  DataCell(Text(date)),
                  DataCell(Text('hello')),
                  DataCell(Text('hello')),
                  DataCell(Text('hello')),
                ]
            ),*/
        //  ]
      ),
    )
  );
}
*/
/*
DataRow func(String date) {
  return(
    DataRow(
        cells: [
          DataCell(Text(date)),
          DataCell(Text('hello')),
          DataCell(Text('hello')),
          DataCell(Text('hello')),
        ]
    )

  );
}*/

/*switch_month(dropdown,context) {
  //   get_proximity_monthly_data(dropdown)  - func name
  return(  (jan_timeline(context,dropdown))/*
      (dropdown=='January')
          ?(jan_timeline(context,dropdown))
          :(feb_timeline(context))    */   //(data_timeline(february,context))
  );
}*/

ConstrainedBox monthlyData(dropdown, context) {
  List month;
  switch (dropdown) {
    case 'January':
      month = january;
      break;
    case 'February':
      month = february;
      break;
    case 'March':
      month = march;
      break;
    default:
      month = january;
  }
  ;

  return (ConstrainedBox(
    constraints: BoxConstraints(
      minWidth: MediaQuery.of(context).size.width,
    ),
    //width: MediaQuery.of(context).size.width,
    child: DataTable(
        columnSpacing: 10,
        dividerThickness: 5,
        columns: [
          DataColumn(
            label: Center(
              child: Text(
                'Date',
                style: TextStyle(fontSize: 17),
                // textAlign: TextAlign.center,
              ),
            ),

            // color: Colors.red,
          ),
          DataColumn(
            label: Text(
              'Max\nInactivity',
              style: TextStyle(color: Colors.black, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
          DataColumn(
              label: Text(
            'Washroom\nVists',
            style: TextStyle(color: Colors.black, fontSize: 17),
            textAlign: TextAlign.center,
          )),
          DataColumn(
              label: Text(
            'Incidents',
            style: TextStyle(color: Colors.black, fontSize: 17),
            //  textAlign: TextAlign.center,
          )),
        ],
        rows:
            //  month1=january;
            month
                .map((data) => DataRow(cells: [
                      DataCell(
                        Text(
                          data.date,
                          style: TextStyle(fontSize: 17),
                          //textAlign: TextAlign.center,
                        ),
                        /* onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => proximity()),
                       );}  */
                      ),
                      DataCell(Center(
                          child: Text(
                        '${data.max_inactive}',
                        style: TextStyle(fontSize: 17),
                      ))),
                      DataCell(Center(
                          child: Text(
                        '${data.washroom}',
                        style: TextStyle(fontSize: 17),
                      ))),
                      DataCell(Center(
                          child: Row(
                        children: [
                          (data.incidents > 0)
                              ? (Text(
                                  '${data.incidents}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.red,
                                  ),
                                ))
                              : (Text(
                                  '${data.incidents}',
                                  style: TextStyle(fontSize: 17),
                                )),
                          (data.incidents > 0)
                              ? IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.red),
                                  onPressed: () => Navigator.of(context).pop(),
                                )
                              : IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.green),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                        ],
                      )))
                    ]))
                .toList()),
  ));
}

class proximity_history extends StatefulWidget {
  @override
  _proximity_historyState createState() => _proximity_historyState();
}

class _proximity_historyState extends State<proximity_history> {
  String dropdown = 'January';
  List listItem = ['January', 'February', 'March', 'April'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => proximity()),
            );
          },
        )),
        title: Text('History',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.red,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()),
              );
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
        child: ListView(shrinkWrap: true, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
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
                        child: Text(valueitem,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            )),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30),

                monthlyData(dropdown, context),

                /* Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: */
                /*ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width,),
                                  //width: MediaQuery.of(context).size.width,
                                  child:
                                  DataTable(
                                    columnSpacing: 10,
                                            dividerThickness: 5,
                                            columns: [
                                              DataColumn(label: Center(
                                                child: Text(
                                                    'Date',
                                                  style: TextStyle(
                                                      fontSize:17),
                                                   // textAlign: TextAlign.center,
                                                  ),
                                              ),

                                               // color: Colors.red,
                                              ),
                                              DataColumn(label: Text(
                                                    'Max\nInactivity',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:17),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              DataColumn(label: Text(
                                                  'Washroom\nVists',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:17),
                                                textAlign: TextAlign.center,
                                              )),
                                              DataColumn(label: Text(
                                                  'Incidents',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:17),
                                              //  textAlign: TextAlign.center,
                                              )),
                                            ],
                                            rows:
                                              january.map((data)=> DataRow(
                                                cells:[
                                                DataCell(Text(
                                                    data.date,
                                                  style: TextStyle(
                                                      fontSize:17),
                                                  //textAlign: TextAlign.center,
                                                ),
                                                onTap: (){
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => proximity()),
                                                  );}
                                                ),
                                                DataCell(Center(
                                                    child: Text(
                                                    '${data.max_inactive}',
                                                      style: TextStyle(
                                                      fontSize:17),
                                                    ))),
                                                DataCell(Center(
                                                    child: Text(
                                                        '${data.washroom}',
                                                      style: TextStyle(
                                                          fontSize:17),
                                                    ))),
                                                DataCell(Center(
                                                    child: Row(
                                                      children: [
                                                        (data.incidents>0)
                                                        ? (Text(
                                                          '${data.incidents}',
                                                          style: TextStyle(
                                                              fontSize:17,
                                                          color: Colors.red,
                                                          ),
                                                        ))
                                                            : (Text(
                                                          '${data.incidents}',
                                                          style: TextStyle(
                                                              fontSize:17),
                                                        ))
                                                        ,
                                                        IconButton(
                                                          icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
                                                          onPressed: () => Navigator.of(context).pop(),
                                                        )
                                                      ],
                                                    )))
                                                ]
                                              )).toList()
                                          ),

                                ),  */
                //        ),
                //    ),
              ],
            ),
          ),
        ]),
      ), //for listview]

      bottomNavigationBar: Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => proximity()),
            );
          },
          child: Text('TODAY',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              )),
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.red), borderRadius: new BorderRadius.circular(20.0)),
        ),
      ),
    );
  }
}
