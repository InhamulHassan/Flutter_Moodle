import 'package:flutter/material.dart';
import 'package:moodle_app/Components/DrawerItem.dart';
import 'package:moodle_app/Components/ExpandableDrawerItem.dart';
import 'package:moodle_app/Pages/Home/style.dart';
import 'package:moodle_app/Screens/Home/homeScreen.dart';
import 'package:moodle_app/Screens/Attendance/attendanceScreen.dart';
import 'package:moodle_app/Screens/Timetable/timetableScreen.dart';
import 'package:moodle_app/Pages/Home/screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var activeScreen = attendanceScreen;

//  bool _drawerState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        primary: true,
        title: Text(activeScreen.title),
      ),
      drawer: _navigationDrawer(context),
      body: activeScreen.buildContext(context),
    );
  }

//  _handleDrawer() async {
//    ScaffoldState _scaffold = _scaffoldKey.currentState;
//    _drawerState = _scaffold.isDrawerOpen;
//    setState(() {
//      if (_drawerState) {
//        Navigator.pop(_scaffoldKey.currentContext);
//      } else {
//        _scaffold.openDrawer();
//      }
//    });
//  }

  _navigationDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _userAccountDrawer('Inhamul Hassan', 'example@email.com', null),
//          _drawerItem(context, 'Home', Icons.home, homeScreen),
//          _drawerItem(context, 'Attendance', Icons.today, attendanceScreen),
//          _drawerItem(context, 'Timetable', Icons.date_range, timetableScreen),
          DrawerItem(
            title: 'Home',
            icon: Icons.home,
            selected: activeScreen == homeScreen,
            newScreen: homeScreen,
            onTap: () => setState(
                  () {
                    activeScreen = homeScreen;
                    Navigator.pop(_scaffoldKey.currentContext);
                  },
                ),
          ),
          DrawerItem(
            title: 'Attendance',
            icon: Icons.today,
            selected: activeScreen == attendanceScreen,
            newScreen: attendanceScreen,
            onTap: () => setState(
                  () {
                    activeScreen = attendanceScreen;
                    Navigator.pop(_scaffoldKey.currentContext);
                  },
                ),
          ),
          DrawerItem(
            title: 'Timetable',
            icon: Icons.date_range,
            selected: activeScreen == timetableScreen,
            newScreen: timetableScreen,
            onTap: () => setState(
                  () {
                    activeScreen = timetableScreen;
                    Navigator.pop(_scaffoldKey.currentContext);
                  },
                ),
          ),
          ExpandableDrawerItem(
            backgroundColor: Theme.of(context).primaryColorLight,
            initiallyExpanded: false,
            onExpansionChanged: (bool) => print(bool),
            title: DrawerItem(
              title: 'Expanded Drawer',
              icon: Icons.explicit,
              selected: activeScreen == timetableScreen,
              newScreen: timetableScreen,
              onTap: () => setState(
                    () {
                      activeScreen = timetableScreen;
                      Navigator.pop(_scaffoldKey.currentContext);
                    },
                  ),
            ),
            children: <Widget>[
              Text('A'),
              Text('A'),
              Text('A'),
            ],
          ),
        ],
      ),
    );
  }

//set the userImageAsset as null if you want the user initials to appear
  _userAccountDrawer(String userName, userEmail, String userImageAsset) {
    return UserAccountsDrawerHeader(
      accountName: Text(userName),
      accountEmail: Text(userEmail),
      onDetailsPressed: () => true,
      currentAccountPicture: CircleAvatar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        radius: 30.0,
        backgroundImage:
            userImageAsset == null ? null : AssetImage(userImageAsset),
        child: Text(
          userImageAsset ?? _getUserInitials(userName),
          maxLines: 1,
          textAlign: TextAlign.center,
          textScaleFactor: 2.0,
        ),
      ),
    );
  }

  _getUserInitials(String userName) {
    String initials = '';
    List<String> strList = userName.trim().split(' ');
    int lstLength = strList.length;
    for (int i = 0; i < lstLength; i++) {
      if (lstLength <= 1) {
        initials = strList[i].substring(0, 2).toUpperCase();
      } else if (i < 2) {
        initials += strList[i].substring(0, 1).toUpperCase();
      }
    }
    return initials;
  }

  _drawerItem(
      BuildContext context, String title, IconData icon, Screen newScreen) {
    bool selected = activeScreen == newScreen;
    Color color = selected ? Theme.of(context).accentColor : Colors.blueGrey;
    Color accentColor = Colors.black12;
    return Material(
      child: InkWell(
        splashColor: accentColor,
        enableFeedback: true,
        onTap: () => setState(() {
              activeScreen = newScreen;
              Navigator.pop(_scaffoldKey.currentContext);
            }),
        child: Container(
          width: double.infinity,
          height: 80.0,
          color: Colors.transparent,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: 10.0,
          ),
          foregroundDecoration: BoxDecoration(
              border: selected
                  ? Border(
                      left: BorderSide(
                        width: 5.0,
                        color: Theme.of(context).accentColor,
                        style: BorderStyle.solid,
                      ),
                    )
                  : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(
                  icon,
                  color: color,
                  size: 30.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 5.0,
                  ),
                  child: Text(
                    title,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: color,
                      fontSize: 20.0,
                      fontWeight:
                          selected ? FontWeight.w900 : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// the drawerListTile is made using flutter's ListTile widget
  /// the reason for using our own custom widget is due to the need for
  /// expandable ListTiles, that on expansion will show more ListTiles, although that could be
  /// accomplished using the ListTile, we wanted to have our own app style
//  _drawerListTile(
//      BuildContext context, String title, IconData icon, bool selected) {
//    Color color = selected ? Theme.of(context).accentColor : Colors.blueGrey;
//    return ListTile(
//      leading: Icon(
//        icon,
//        color: color,
//        size: 30.0,
//      ),
//      onTap: () => true,
//      trailing:
//          IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () => true),
//      title: Text(
//        title,
//        maxLines: 1,
//        textAlign: TextAlign.start,
//        style: TextStyle(
//          color: color,
//          fontSize: 18.0,
//          decoration: selected ? TextDecoration.underline : null,
//          decorationStyle: TextDecorationStyle.solid,
//          fontWeight: selected ? FontWeight.w900 : FontWeight.normal,
//        ),
//      ),
//      selected: selected,
//    );
//  }

  _expandableDrawerItem(BuildContext context, String title, IconData icon,
      Screen newScreen, WidgetBuilder builder) {
    bool selected = false;
//
//    Color color = selected ? Theme.of(context).accentColor : Colors.blueGrey;
//    Color accentColor = Colors.black12;
    return ExpandableDrawerItem(
      onExpansionChanged: (bool) => setState(() => selected = bool),
      backgroundColor: Theme.of(context).accentColor,
      initiallyExpanded: false,
      children: <Widget>[builder(context)],
    );
  }
}

//          _expandableDrawerItem(
//              context, 'Expandable', Icons.add_box, timetableScreen, (context) {
//            return Column(
//              children: <Widget>[
//                _drawerItem(context, 'Home', Icons.home, homeScreen),
//                _drawerItem(
//                    context, 'Attendance', Icons.today, attendanceScreen),
//                _drawerItem(
//                    context, 'Timetable', Icons.date_range, timetableScreen),
//              ],
//            );
//          })
