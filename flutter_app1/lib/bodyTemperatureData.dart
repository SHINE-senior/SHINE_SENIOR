class time_temp{
  String time;
  String temperature;

  time_temp({this.time,this.temperature});
}

List<time_temp> today = [
  time_temp(temperature:'38.1 C', time:'6.00 pm'),
  time_temp(temperature:'37.6 C', time:'4.00 pm'),
  time_temp(temperature:'37.1 C', time:'2.00 pm'),
  time_temp(temperature:'37.0 C', time:'12.00 pm'),
  time_temp(temperature:'37.5 C', time:'10.00 am'),
  time_temp(temperature:'36.9 C', time:'8.00 am')
];

List<time_temp> yesterday = [
  time_temp(temperature:'38.0 C', time:'6.00 pm'),
  time_temp(temperature:'37.7 C', time:'4.00 pm'),
  time_temp(temperature:'36.9 C', time:'2.00 pm'),
  time_temp(temperature:'37.0 C', time:'12.00 pm'),
  time_temp(temperature:'37.5 C', time:'10.00 am'),
  time_temp(temperature:'36.9 C', time:'8.00 am')
];
