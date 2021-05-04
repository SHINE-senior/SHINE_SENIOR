import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'proximity.dart';
import 'confirmation.dart';

class DashboardPage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const String ATTEND_TO_SENIOR = 'ATTEND TO SENIOR';
  static const String CALL_SENIOR = 'CALL SENIOR';
  static const String CALL_AMBULANCE = 'CALL AMBULANCE';
  static const String CALL_NEAREST_HELP = 'CALL NEAREST HELP';

  bool _isSOS = false;
  List<String> actionsTaken = List<String>.empty(growable: true);

  void _addNewAction(String buttonText) {
    switch (buttonText) {
      case ATTEND_TO_SENIOR:
        actionsTaken.add('Attended to senior');
        break;
      case CALL_SENIOR:
        actionsTaken.add('Called senior');
        break;
      case CALL_AMBULANCE:
        actionsTaken.add('Called ambulance');
        break;

      //if call nearest help is activated
      default:
        actionsTaken.add('Called ' + buttonText);
    }
  }

  void _showSosPopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                //this the 'X' button
                _xButton(),
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Your senior has fallen in the kitchen! Choose your action now:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      //Buttons
                      _redElevatedButton(Icons.call, ATTEND_TO_SENIOR),
                      _redElevatedButton(Icons.call, CALL_SENIOR),
                      _redElevatedButton(Icons.call, CALL_AMBULANCE),
                      _outlinedCallNearestButton(Icons.call, CALL_NEAREST_HELP),
                      SizedBox(width: 20),
                      _showActionsTaken(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  _showNearestHelpPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              //this the 'X' button
              _xButton(),
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Call nearest contact', style: TextStyle(color: Colors.black, fontSize: 16)),
                    _outlinedCallButton(Icons.call, 'JOHN (son)'), //todo: change the '(relationship)' to the next line
                    _outlinedCallButton(Icons.call, 'LILY (daughter)'),
                    _outlinedCallButton(Icons.call, 'AH HOCK (neighbour)'),
                    _outlinedCallButton(Icons.call, 'ANOTHER NUMBER:'),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.call),
                        hintText: 'Enter a number',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _showActionsTaken() {
    return Column(
      //todo: list the actions dynamically
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Actions Taken: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
          height: 150.0, // Change as per your requirement
          width: 300.0,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: actionsTaken.length,
            itemBuilder: (BuildContext context, int index) {
              return _actionRowContainer(actionsTaken[index]);
            },
          ),
        ),
//          _actionRowContainer('Called senior'),
        _actionRowContainer('Called neighbour'),
      ],
    );
  }

  Positioned _xButton() {
    return Positioned(
      right: -40.0,
      top: -40.0,
      child: InkResponse(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: CircleAvatar(
          child: Icon(Icons.close),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }

  SizedBox _redElevatedButton(IconData icon, String text) {
    return SizedBox(
      width: double.infinity, // <-- match_parent
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
        onPressed: () {
          Navigator.of(context).pop();
          _addNewAction(text);
          _showSosPopup();
        },
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white),
            SizedBox(width: 20),
            Text(text, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  SizedBox _outlinedCallButton(IconData icon, String personCalled) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).pop();
          _addNewAction(personCalled);
          _showSosPopup();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 3.0, color: Colors.red),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.red),
            SizedBox(width: 20),
            Text(personCalled, style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold) //todo: use pri color
                ),
          ],
        ),
      ),
    );
  }

  SizedBox _outlinedCallNearestButton(IconData icon, String text) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).pop();
          _showNearestHelpPopup();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 3.0, color: Colors.red),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.red),
            SizedBox(width: 20),
            Text(text, style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold) //todo: use pri color
                ),
          ],
        ),
      ),
    );
  }

  Row _actionRowContainer(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(
          //TODO crop image instead of squeeze
          width: 20.0, //TODO set to row width
          height: 20.0, //TODO set to row height
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/arrow.png'),
            ),
          ),
        ),
        SizedBox(width: 20),
        Text(text),
      ],
    );
  }

  Widget _sosWidget() {
    if (_isSOS) {
      return Text(
        'Everything\'s good!',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Column(children: <Widget>[
        Text(
          'Oh no! Your senior has fallen in the kitchen. Call your senior and check on them!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: double.infinity, // <-- match_parent
          child: ElevatedButton(
            onPressed: _showSosPopup,
            child: Text(
              'SOS',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity, // <-- match_parent
          child: OutlinedButton(
            onPressed: _showSosPopup,
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 3.0, color: Colors.red),
            ),
            child: Text(
              'Report Incident',
              style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold), //todo: use pri color
            ),
          ),
        ),
      ]);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'SHINE Senior',
      theme: ThemeData(
        primarySwatch: Colors.red, //may need to change it
        textTheme: TextTheme(
            //headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
//          leading:
          title: Text('Dashboard',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.blue), //add this line here
          actions: <Widget>[
            IconButton(
              icon: CircleAvatar(
                backgroundImage: SeniorData.getSeniorImage(),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(), //TODO: Set the side navigation drawer
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: _dashboard(),
          ),
        ),

//      bottomNavigationBar: BottomNavigationBar(),
//        bottomNavigationBar: Container(
//          height: 40,
//          //width: 56,
//          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
//          child: RaisedButton(
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => proximity()),
//              );
//            },
//            child: Text('PROXIMITY',
//                style: TextStyle(
//                  fontSize: 15,
//                  color: Colors.white,
//                )),
//            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
//            color: Colors.red,
//          ),
//        ),
      ),
    );
  }

  Widget _dashboard() {
    DateTime curDate = DateTime.now();
    String curDateStr = DateFormat('dd-MMM-yyyy').format(curDate);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        //dropdown
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("dropdown placeholder"),
              Text(
                curDateStr,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
        _currentStatus(), //sos-section
        //TODO: camera view. I am not sure how to handle data that involves live video
        GridView.count(
          primary: false,
//          padding: const EdgeInsets.all(20),
          crossAxisCount: 2, //this makes it 2x2
          shrinkWrap: true,
          children: List.generate(
            SeniorData.SensorSummaryList().length,
            (index) {
              return Center(
                child: SensorInkwellCard(sensorSummary: SeniorData.SensorSummaryList()[index]),
              );
            },
          ),
//          children: _getSensorCardsList(), SensorSummaryList()
        ),
      ],
    );
  }

  Widget _currentStatus() {
    if (SeniorData.isStatusAlarming())
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Oh no! Your senior has fallen in the kitchen. Call your senior and check on them!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: double.infinity, // <-- match_parent
            child: ElevatedButton(
              onPressed: () {
                _showSosPopup();
              },
              child: Text(
                'SOS',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity, // <-- match_parent
            child: OutlinedButton(
              onPressed: () {
                //todo:lead to report page
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SOSPopup()),
//                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 3.0, color: Colors.red),
              ),
              child: Text(
                'Report Incident',
                style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold), //todo: use pri color
              ),
            ),
          ),
        ],
      );
    else
      return Text("Everything looks great!");
  }
}

class SensorInkwellCard extends StatelessWidget {
  const SensorInkwellCard({Key key, this.sensorSummary}) : super(key: key);
  final SensorSummary sensorSummary;
  final Color greenIcon = const Color(0xFF13A806);
  final Color greenCard = const Color(0xFFEBF8DE);

  //TODO: when doing for the below colors, get updated the color codes from figma
//  final Color redIcon;
//  final Color redCard;
//  final Color yellowIcon;
//  final Color yellowCard;

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    Color iconColor;
    if (sensorSummary.status == "green") {
      cardColor = greenCard;
      iconColor = greenIcon;
    }
    //TODO: do the above for RED and AMBER colours/status

    final TextStyle sensorNameStyle = TextStyle(fontSize: 16, color: iconColor, fontWeight: FontWeight.bold);
    final TextStyle sensorDetailStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);

    return InkWell(
      onTap: () {
        if (sensorSummary.title == "proximity") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => proximity()));
        }
        //TODO: when other pages are done link to them as well
      },
      child: Card(
        color: cardColor,
        margin: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Expanded(
                flex: 3,
                child: new FittedBox(
                  fit: BoxFit.fill,
                  child: ImageIcon(sensorSummary.iconImage, color: iconColor),
                ),
              ),
              SizedBox(height: 10),
              Text(sensorSummary.title, style: sensorNameStyle),
              SizedBox(height: 10),
              Text(sensorSummary.details, style: sensorDetailStyle),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

/*
THESE ARE DUMMY CLASSES AND METHODS (dummy external API)
 */
class SeniorData {
  static ImageProvider getSeniorImage() {
//    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    return new AssetImage('images/senior_maytan.PNG');
  }

  static bool isStatusAlarming() {
    return true; //if SOS for senior is triggered
//    return false;
  }

  static List<SensorSummary> SensorSummaryList() {
    List<SensorSummary> sensorSummaries = <SensorSummary>[
      SensorSummary(title: 'proximity', iconImage: AssetImage('images/icons/proximity.png'), details: "Kitchen", status: "green"),
      SensorSummary(title: 'bodytemp', iconImage: AssetImage('images/icons/bodyTemp.png'), details: "38.8\u00b0C", status: "green"),
      //degree symbol unicode: \u00b0
    ];
    return sensorSummaries;
  }
}

class SensorSummary {
  SensorSummary({this.title, this.details, this.iconImage, this.status});
  AssetImage iconImage;
  String title;
  String status;
  String details;
}
