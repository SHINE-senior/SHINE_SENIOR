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
