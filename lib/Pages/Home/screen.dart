import 'package:flutter/material.dart';

/// this is a custom class that is used by the [DrawerItem] and [ExpandableDrawerItem] classes
/// to specify which screen to show the user when they tap on the corresponding drawer tile
class Screen {
  /// the [Screen] class takes in two parameters which are required to instantiate this class
  /// the [title] parameter takes in a variable of [String] datatype, this parameter is used to
  /// specify the title of the Screen which will be displayed on the screen's appbar.
  @required
  final String title;

  /// the [buildContext] variable takes in a [WidgetBuilder] as a parameter, this requires
  /// the [context] of the parent's state to be able to build widgets on the parent.
  /// The [WidgetBuilder] is basically a widget that builds other widgets
  @required
  final WidgetBuilder buildContext;

  Screen({this.title, this.buildContext});
}
