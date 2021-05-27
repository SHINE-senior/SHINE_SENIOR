import 'package:flutter/material.dart';
import 'doorContact.dart';
import 'dashboard.dart';
import 'doorContactData.dart';
import 'doorContactDate.dart';



ConstrainedBox monthlyData(dropdown,context){

  List month;
  switch(dropdown){
    case 'January': month=january;
    break;
    case 'February': month=february;
    break;
    default: month=january;
  };
  String value;
  return(
      ConstrainedBox(
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
              ),
              DataColumn(label: Text(
                'Door Opened/\nClosed',
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
            month.map((data)=> DataRow(
                cells:[
                  DataCell(Text(
                    data.date,
                    style: TextStyle(
                        fontSize:17),
                    //textAlign: TextAlign.center,
                  ),
                    // onTap: (){}
                  ),
                  DataCell(Center(
                      child: Text(
                        '${data.door}',
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
                          )),

                          (data.incidents>0)
                              ? IconButton(
                            icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.red
                            ),
                            onPressed: () {
                              value = data.date;
                              print(data.date);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => doorContactDate()),
                              );
                            },
                          )
                              : IconButton(
                            icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.green
                            ),
                            //onPressed: () => Navigator.of(context).pop(),
                            onPressed: () {
                              value = data.date;
                              print(data.date);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => doorContactDate()),
                              );
                            },
                          ),
                        ],
                      )
                  )
                  )
                ]
            )).toList()
        ),
      )
  );
}



class doorContactHistory extends StatefulWidget {
  @override
  _doorContactHistoryState createState() => _doorContactHistoryState();
}

class _doorContactHistoryState extends State<doorContactHistory> {

  String dropdown = 'January';
  List listItem = ['January','February','March','April'];

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
                    MaterialPageRoute(builder: (context) => doorContact()),//MyHomePage()),
                  );
                },
              )
          ),
          title:Text(
              'History',
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
        padding: const EdgeInsets.fromLTRB(15,20,15,10),
        child: ListView(
            shrinkWrap: true,
            children: [ Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 10),
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
                  SizedBox(height: 30),

                  monthlyData(dropdown, context),
                ],
              ),
            ),]
        ),
      ),

      bottomNavigationBar:  Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => doorContact()),
            );
          },
          child: Text(
              'TODAY',
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
