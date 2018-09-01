import 'package:flutter/material.dart';
import 'package:moodle_app/Pages/Home/screen.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({
    Key key,
    this.title,
    this.icon,
    this.newScreen,
    this.selected,
    this.onTap,
  })  : assert(title != null),
        assert(newScreen != null),
        assert(selected != null),
        super(key: key);

  /// The title of the drawer tile
  final String title;

  /// The icon that will be displayed at the start/leading position of the widget
  final IconData icon;

  /// The screen that the user would be directed on tapping the widget
  /// the [Screen] class is a custom class that contains the widget that is displayed
  /// on the main [Scaffold] when the corresponding [DrawerItem] is tapped
  final Screen newScreen;

  /// This parameter takes in a boolean, it specifies if the current [DrawerItem] is
  /// the currently selected item, and is used to specify some UI changes to the layout
  /// such as the left accentuated border, the text and icon color
  /// the selected parameter will typically look like this
  /// ```dart
  ///
  ///     selected = activeScreen == currentScreen;
  ///
  /// ```dart
  final bool selected;

  /// This parameter is called when the [DrawerItem] is tapped, would typically include
  /// a [setState] method that specifies the active screen, and closes (pops) the parent [Drawer]
  /// ```dart
  /// onTap: () => setState(
  ///   () {
  ///     activeScreen = attendanceScreen;
  ///     Navigator.pop(_scaffoldKey.currentContext);
  ///   },
  /// ),
  /// ```dart
  final VoidCallback onTap;

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    Color color =
        widget.selected ? Theme.of(context).accentColor : Colors.blueGrey;
    Color accentColor = Colors.black12;

    return Material(
      child: InkWell(
        splashColor: accentColor,
        enableFeedback: true,
        onTap: widget.onTap,
        child: Container(
          width: double.minPositive,
          height: 80.0,
          color: Colors.transparent,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: 10.0,
          ),
          foregroundDecoration: BoxDecoration(
              border: widget.selected
                  ? Border(
                      left: BorderSide(
                        width: 5.0,
                        color: color,
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
                  widget.icon,
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
                    widget.title,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: color,
                      fontSize: 20.0,
                      fontWeight:
                          widget.selected ? FontWeight.w900 : FontWeight.normal,
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
}
