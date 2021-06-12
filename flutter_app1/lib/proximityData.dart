class time_loc{
  String time;
  String location;

  time_loc({this.time,this.location});
}

List<time_loc> proximityToday = [
  time_loc(location:'Living', time:'6.00 pm'),
  time_loc(location:'Kitchen', time:'3.00 pm'),
  time_loc(location:'Bedroom', time:'2.00 pm'),
  time_loc(location:'Washroom', time:'12.00 pm'),
  time_loc(location:'Living', time:'10.30 am'),
  time_loc(location:'Bedroom', time:'8.00 am')
];

List<time_loc> yesterday = [
  time_loc(location:'Washroom', time:'5.00 pm'),
  time_loc(location:'Living', time:'3.00 pm'),
  time_loc(location:'Bedroom', time:'1.30 pm'),
  //time_loc(location:'Bedroom', time:'12.00 pm'),
  time_loc(location:'Living', time:'9.00 am'),
  time_loc(location:'Washroom', time:'7.00 am'),
  time_loc(location:'Bedroom', time:'5.00 am'),
  time_loc(location:'Living', time:'3.30 am'),
  time_loc(location:'Washroom', time:'1.00 am')
];



List<time_loc> date_01_01_2021 = [
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


List<time_loc> date_02_01_2021 = [
  time_loc(location:'Washroom', time:'5.00 pm'),
  time_loc(location:'Living', time:'4.00 pm'),
  time_loc(location:'Washroom', time:'1.30 pm'),
  //time_loc(location:'Bedroom', time:'12.00 pm'),
  time_loc(location:'Living', time:'9.00 am'),
  time_loc(location:'Bedroom', time:'7.00 am'),
  time_loc(location:'Bedroom', time:'5.00 am'),
  time_loc(location:'Living', time:'3.30 am'),
  time_loc(location:'Bedroom', time:'1.00 am')
];


List<time_loc> date_03_01_2021 = [
  time_loc(location:'Washroom', time:'5.00 pm'),
  time_loc(location:'Living', time:'2.00 pm'),
  time_loc(location:'Washroom', time:'1.30 pm'),
  //time_loc(location:'Bedroom', time:'12.00 pm'),
  time_loc(location:'Living', time:'9.00 am'),
  time_loc(location:'Bedroom', time:'7.00 am'),
  time_loc(location:'Bedroom', time:'5.00 am'),
  time_loc(location:'Living', time:'3.30 am'),
  time_loc(location:'Bedroom', time:'1.00 am')
];


List<time_loc> date_04_01_2021 = [
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

List<time_loc> date_05_01_2021 = [
  time_loc(location:'Washroom', time:'5.00 pm'),
  time_loc(location:'Living', time:'3.00 pm'),
  time_loc(location:'Washroom', time:'1.30 pm'),
  time_loc(location:'Bedroom', time:'12.00 pm'),
  time_loc(location:'Living', time:'9.00 am'),
  time_loc(location:'Bedroom', time:'7.00 am'),
  time_loc(location:'Bedroom', time:'5.00 am'),
  time_loc(location:'Living', time:'3.30 am'),
  time_loc(location:'Bedroom', time:'1.00 am')
];

List<time_loc> date_06_01_2021 = [
  time_loc(location:'Washroom', time:'5.00 pm'),
  time_loc(location:'Living', time:'3.00 pm'),
  time_loc(location:'Washroom', time:'1.30 pm'),
  time_loc(location:'Bedroom', time:'12.00 pm'),
  //time_loc(location:'Living', time:'9.00 am'),
  time_loc(location:'Bedroom', time:'7.00 am'),
  time_loc(location:'Bedroom', time:'5.00 am'),
  time_loc(location:'Living', time:'3.30 am'),
  time_loc(location:'Bedroom', time:'1.00 am')
];

List<time_loc> date_07_01_2021 = [
  //time_loc(location:'Washroom', time:'5.00 pm'),
  time_loc(location:'Living', time:'3.00 pm'),
  time_loc(location:'Washroom', time:'1.30 pm'),
  //time_loc(location:'Bedroom', time:'12.00 pm'),
  time_loc(location:'Living', time:'9.00 am'),
  time_loc(location:'Bedroom', time:'7.00 am'),
  time_loc(location:'Bedroom', time:'5.00 am'),
  time_loc(location:'Living', time:'3.30 am'),
  time_loc(location:'Bedroom', time:'1.00 am')
];

//List sub_date_01_01_2021 = date_01_01_2021.sublist(1, date_01_01_2021.length-1);

//int total = date_01_01_2021.length;
//var mytime='5.00 pm';


class history{
  String date;
  int max_inactive;
  int washroom;
  int incidents;

  history({this.date,this.max_inactive,this.washroom,this.incidents});
}


var january = <history>[
  history(date:'01-Jan-21',max_inactive:2,washroom:2,incidents:0),
  history(date:'02-Jan-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'03-Jan-21',max_inactive:4,washroom:4,incidents:1),
  history(date:'04-Jan-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'05-Jan-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'06-Jan-21',max_inactive:2,washroom:3,incidents:1),
  history(date:'07-Jan-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'08-Jan-21',max_inactive:2,washroom:3,incidents:1),
  history(date:'09-Jan-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'10-Jan-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'11-Jan-21',max_inactive:2,washroom:3,incidents:1),
];

var february = <history>[
  history(date:'1-Feb-21',max_inactive:2,washroom:2,incidents:0),
  history(date:'2-Feb-21',max_inactive:4,washroom:3,incidents:1),
  history(date:'3-Feb-21',max_inactive:2,washroom:4,incidents:0),
  history(date:'4-Feb-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'5-Feb-21',max_inactive:4,washroom:3,incidents:1),
  history(date:'6-Feb-21',max_inactive:2,washroom:3,incidents:1),
  history(date:'7-Feb-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'8-Feb-21',max_inactive:2,washroom:3,incidents:1),
  history(date:'9-Feb-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'10-Feb-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'11-Feb-21',max_inactive:2,washroom:3,incidents:1),
];

var march = <history>[
  history(date:'1-Mar-21',max_inactive:2,washroom:2,incidents:0),
  history(date:'2-Mar-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'3-Mar-21',max_inactive:4,washroom:4,incidents:1),
  history(date:'4-Mar-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'5-Mar-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'6-Mar-21',max_inactive:2,washroom:3,incidents:1),
  history(date:'7-Mar-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'8-Mar-21',max_inactive:2,washroom:3,incidents:1),
  history(date:'9-Mar-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'10-Mar-21',max_inactive:2,washroom:3,incidents:0),
  history(date:'11-Mar-21',max_inactive:2,washroom:3,incidents:1),
];
