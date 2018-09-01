import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard(
      {Key key,
      this.courseTitle,
      this.sessionDate,
      this.startTime,
      this.endTime,
      this.onTap,
      this.isMarked = false,
      this.isNameNecessary = false})
      : super(key: key);

  /// The title of the course
  final String courseTitle;

  /// If the attendance for the specified course on its respective date/time is marked or not
  final bool isMarked;

  /// If the name of the Teacher/Instructor is to be shown or not
  /// It should be shown if signed in as an Administrator, but if a Teacher/Instructor
  /// signs in, since they will only see their own Attendance Cards, their names does not
  /// need to be shown
  final bool isNameNecessary;

  /// The date of the class session, the [AttendanceCard] will display the
  /// short month name (eg: Aug, Sep) [DateFormat.MMM] along with the
  /// date number (eg: 05, 27)
  final DateTime sessionDate;

  /// The starting time of the session, the time will be converted to a
  /// [DateTime] and displayed in the 12-hour format (eg: 10:30AM)
  /// The [startTime] value should be supplied with two parameters:
  ///   hour: The hour value should be supplied in the 24-hour format (0..23)
  ///   minute: The minute value should be a value between 0..59
  final TimeOfDay startTime;

  /// The ending time of the session, the time will be converted to a
  /// [DateTime] and displayed in the 12-hour format (eg: 01:00PM)
  /// The [endTime] value should be supplied with two parameters:
  ///   hour: The hour value should be supplied in the 24-hour format (0..23)
  ///   minute: The minute value should be a value between 0..59
  final TimeOfDay endTime;

  /// This parameter is called when the [AttendanceCard] is tapped, would typically include
  /// a [setState] method that specifies the attendance screen, and closes (pops) the parent [Drawer]
  /// ```dart
  /// onTap: () => setState(
  ///   () {
  ///   TODO
  ///     activeScreen = attendanceScreen;
  ///     Navigator.pop(_scaffoldKey.currentContext);
  ///   },
  /// ),
  /// ```dart
  final GestureTapCallback onTap;

  @override
  _AttendanceCardState createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      key: widget.key,
      color: Colors.white,
      elevation: 1.0,
      margin: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: InkWell(
        onTap: () => widget.onTap,
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
                _cardMonthText(
                  DateFormat.MMM().format(
                        widget.sessionDate,
                      ),
                ),
                //the month name of the attendance card, supplied as a date
                _cardMonthText(
                  DateFormat('dd').format(
                    widget.sessionDate,
                  ),
                ),
                //the day number displayed on the attendance, supplied as a date
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  widget.courseTitle,
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
                _cardTimeSpan(widget.startTime, widget.endTime),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.isMarked ? Colors.greenAccent : Colors.blue,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(10.0),
              child: widget.isMarked
                  ? Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                    )
                  : Icon(
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

_cardTimeSpan(TimeOfDay start, TimeOfDay end) {
  String startTime = DateFormat.jm().format(DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, start.hour, start.minute));
  String endTime = DateFormat.jm().format(DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, end.hour, end.minute));
//  String startTime = start.hourOfPeriod.toString() +
//      ":" +
//      start.minute.toString() +
//      _returnDayPeriod(start.period);
//  String endTime = end.hourOfPeriod.toString() +
//      ":" +
//      end.minute.toString() +
//      _returnDayPeriod(end.period);
  return Text(
    startTime + ' - ' + endTime,
    maxLines: 1,
    overflow: TextOverflow.fade,
    softWrap: false,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: Colors.black87,
      fontSize: 14.0,
      fontWeight: FontWeight.w300,
    ),
  );
}

//_returnDayPeriod(DayPeriod period) {
//  return period == DayPeriod.am ? "AM" : "PM";
//}
