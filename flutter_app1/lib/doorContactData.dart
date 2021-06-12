class time_door{
  String time;
  String door;

  time_door({this.time,this.door});
}

List<time_door> doorToday = [
  time_door(door:'Opened', time:'6.00 pm'),
  time_door(door:'Closed', time:'3.00 pm'),
  time_door(door:'Opened', time:'2.00 pm'),
  //time_door(door:'closed', time:'12.00 pm'),
  time_door(door:'Opened', time:'10.30 am'),
  time_door(door:'Closed', time:'8.00 am')
];

List<time_door> yesterday = [
  time_door(door:'Closed', time:'5.00 pm'),
  time_door(door:'Opened', time:'3.00 pm'),
  time_door(door:'Closed', time:'1.30 pm'),
  time_door(door:'Opened', time:'9.00 am'),
  time_door(door:'Closed', time:'7.00 am'),
  time_door(door:'Opened', time:'5.00 am'),
  time_door(door:'Closed', time:'3.30 am'),
  time_door(door:'Opened', time:'1.00 am')
];

List<time_door> date_01_01_2021 = [
  time_door(door:'Closed', time:'5.00 pm'),
  time_door(door:'Opened', time:'3.00 pm'),
  time_door(door:'Closed', time:'1.30 pm'),
  time_door(door:'Opened', time:'9.00 am'),
  time_door(door:'Closed', time:'7.00 am'),
  time_door(door:'Opened', time:'5.00 am'),
  time_door(door:'Closed', time:'3.30 am'),
  time_door(door:'Opened', time:'1.00 am')
];

List<time_door> date_02_01_2021 = [
  time_door(door:'closed', time:'5.00 pm'),
  time_door(door:'opened', time:'3.00 pm'),
  time_door(door:'closed', time:'1.30 pm'),
  time_door(door:'opened', time:'9.00 am'),
  time_door(door:'closed', time:'7.00 am'),
  time_door(door:'opened', time:'5.00 am'),
  time_door(door:'closed', time:'3.30 am'),
  time_door(door:'opened', time:'1.00 am')
];

List<time_door> date_03_01_2021 = [
  time_door(door:'closed', time:'5.00 pm'),
  time_door(door:'opened', time:'3.00 pm'),
  time_door(door:'closed', time:'1.30 pm'),
  time_door(door:'opened', time:'9.00 am'),
  time_door(door:'closed', time:'7.00 am'),
  time_door(door:'opened', time:'5.00 am'),
  time_door(door:'closed', time:'3.30 am'),
  time_door(door:'opened', time:'1.00 am')
];

List<time_door> date_04_01_2021 = [
  time_door(door:'closed', time:'5.00 pm'),
  time_door(door:'opened', time:'3.00 pm'),
  time_door(door:'closed', time:'1.30 pm'),
  time_door(door:'opened', time:'9.00 am'),
  time_door(door:'closed', time:'7.00 am'),
  time_door(door:'opened', time:'5.00 am'),
  time_door(door:'closed', time:'3.30 am'),
  time_door(door:'opened', time:'1.00 am')
];


class history{
  String date;
  int door;
  int incidents;

  history({this.date,this.door,this.incidents});
}


var january = <history>[
  history(date:'01-Jan-21',door:2,incidents:0),
  history(date:'02-Jan-21',door:2,incidents:0),
  history(date:'03-Jan-21',door:4,incidents:1),
  history(date:'04-Jan-21',door:2,incidents:0),
  history(date:'05-Jan-21',door:2,incidents:0),
  history(date:'06-Jan-21',door:2,incidents:1),
  history(date:'07-Jan-21',door:2,incidents:0),
  history(date:'08-Jan-21',door:2,incidents:1),
  history(date:'09-Jan-21',door:2,incidents:0),
  history(date:'10-Jan-21',door:2,incidents:0),
  history(date:'11-Jan-21',door:2,incidents:1),
];

var february = <history>[
  history(date:'1-Feb-21',door:2,incidents:0),
  history(date:'2-Feb-21',door:4,incidents:1),
  history(date:'3-Feb-21',door:2,incidents:0),
  history(date:'4-Feb-21',door:2,incidents:0),
  history(date:'5-Feb-21',door:4,incidents:1),
  history(date:'6-Feb-21',door:2,incidents:1),
  history(date:'7-Feb-21',door:2,incidents:0),
  history(date:'8-Feb-21',door:2,incidents:1),
  history(date:'9-Feb-21',door:2,incidents:0),
  history(date:'10-Feb-21',door:2,incidents:0),
  history(date:'11-Feb-21',door:2,incidents:1),
];
