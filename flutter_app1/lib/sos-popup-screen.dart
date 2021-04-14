import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHINE Senior',
      theme: ThemeData(
        primarySwatch: Colors.red, //may need to change it
        textTheme: TextTheme(
//          bodyText1: ,
          headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String ATTEND_TO_SENIOR = 'ATTEND TO SENIOR';
  static const String CALL_SENIOR = 'CALL SENIOR';
  static const String CALL_AMBULANCE = 'CALL AMBULANCE';
  static const String CALL_NEAREST_HELP = 'CALL NEAREST HELP';

  bool _isSOS = false;
  List<String> actionsTaken = List<String>.empty(growable: true);

  void _raiseAlarm() {
    setState(() {
      _isSOS = true;
    });
  }

  void _resumeMonitoring() {
    setState(() {
      _isSOS = true;
    });
  }

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

  void _sosPopup() {
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

  _nearestHelpPopup() {
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
        onPressed: () {
          Navigator.of(context).pop();
          _addNewAction(text);
          _sosPopup();
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
          _sosPopup();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 3.0, color: Colors.red),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon),
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
          _nearestHelpPopup();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 3.0, color: Colors.red),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon),
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
            onPressed: _sosPopup,
            child: Text(
              'SOS',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity, // <-- match_parent
          child: OutlinedButton(
            onPressed: _sosPopup,
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHINE Senior',
      theme: ThemeData(
        primarySwatch: Colors.red, //may need to change it
        textTheme: TextTheme(
          headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Dashboard',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    new Container(
                      //TODO crop image instead of squeeze
                      width: 40.0, //TODO set to row width
                      height: 40.0, //TODO set to row height
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/senior_maytan.PNG'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _sosWidget(),
                Text(
                  'Main content',
                ),
              ],
            ),
          ),
        ),

//      bottomNavigationBar: BottomNavigationBar(),
      ),
    );
  }
}
