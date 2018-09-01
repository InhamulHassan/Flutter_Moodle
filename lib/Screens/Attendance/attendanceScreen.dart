import 'package:flutter/material.dart';
import 'package:moodle_app/Pages/Home/screen.dart';
import 'package:moodle_app/Components/AttendanceCard.dart';

final attendanceScreen = Screen(
  title: 'Attendance',
  buildContext: (BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _attendanceCard(),
            AttendanceCard(
              courseTitle: 'Routing Concepts',
              sessionDate: DateTime.utc(2018, 1, 1),
              startTime: TimeOfDay.now(),
              endTime: TimeOfDay.now(),
              onTap: () => true,
            ),
            AttendanceCard(
              courseTitle: 'Cabling Standards',
              sessionDate: DateTime.now(),
              startTime: TimeOfDay(hour: 11, minute: 30),
              endTime: TimeOfDay(hour: 16, minute: 00),
              onTap: () => true,
              isMarked: true,
              isNameNecessary: true,
            ),
          ],
        ),
      ),
    );
  },
);

_attendanceCard() {
  return Card(
    color: Colors.white,
    elevation: 1.0,
    margin: EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 5.0,
    ),
    child: InkWell(
      onTap: () => true,
      splashColor: Colors.black26,
      highlightColor: Colors.lightBlueAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _cardMonthText('Jan'),
              _cardMonthText('18'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Network Security',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  letterSpacing: 0.2,
                  wordSpacing: 2.0,
                ),
              ),
              Text(
                '01.30PM - 04.30PM',
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.warning,
              color: Colors.blue,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 3.0,
              vertical: 15.0,
            ),
          ),
        ],
      ),
    ),
  );
}

_cardMonthText(String text) {
  return Text(
    text,
    textAlign: TextAlign.start,
    overflow: TextOverflow.fade,
    maxLines: 1,
    style: TextStyle(
      color: Colors.black87,
      fontSize: 24.0,
      fontWeight: FontWeight.w100,
      textBaseline: TextBaseline.alphabetic,
    ),
  );
}
