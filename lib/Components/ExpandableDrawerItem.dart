import 'package:flutter/material.dart';

/// This is a custom widget that is derived from the [ExpansionTile] widget,
/// this widget is made because the default widget does not suit the purpose

class ExpandableDrawerItem extends StatefulWidget {
  const ExpandableDrawerItem({
    Key key,
    this.backgroundColor,
    this.onExpansionChanged,
    this.title,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
  })  : assert(initiallyExpanded != null),
        assert(title != null),
        super(key: key);

  /// The background color of the expanded part of the tile
  final Color backgroundColor;

  /// This parameter takes in a function that will be run every time the Drawer item
  /// expands/collapses
  /// ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool> onExpansionChanged;

  /// A widget that is displayed as the title of the [ExpandableDrawerItem],
  /// the primary content of the list item
  final Widget title;

  /// The widgets that are displayed when the [ExpandableDrawerItem] expands,
  /// takes in a list of widgets as its parameter
  final List<Widget> children;

  /// Specifies if the [ExpandableDrawerItem] is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  @override
  _ExpandableDrawerItemState createState() => _ExpandableDrawerItemState();
}

class _ExpandableDrawerItemState extends State<ExpandableDrawerItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _easeOutAnimation;
  CurvedAnimation _easeInAnimation;
  ColorTween _borderColor;
  ColorTween _headerColor;
  ColorTween _iconColor;
  ColorTween _backgroundColor;
  Animation<double> _iconTurns;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: Duration(milliseconds: 200), vsync: this);
    _easeOutAnimation =
        new CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _easeInAnimation =
        new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _borderColor = new ColorTween();
    _headerColor = new ColorTween();
    _iconColor = new ColorTween();
    _iconTurns =
        new Tween<double>(begin: 0.0, end: 0.5).animate(_easeInAnimation);
    _backgroundColor = new ColorTween();

    _isExpanded =
        PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      // above is a single line way to change from true to false, remember it
      if (_isExpanded)
        _controller.forward();
      else
        _controller.reverse().then<void>((Null value) {
          setState(() {
            // Rebuild without widget.children.
          });
        });
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    final Color borderSideColor =
        _borderColor.evaluate(_easeOutAnimation) ?? Colors.transparent;
    final Color titleColor = _headerColor.evaluate(_easeInAnimation);

    return new Container(
      decoration: new BoxDecoration(
        color:
            _backgroundColor.evaluate(_easeOutAnimation) ?? Colors.transparent,
        border: new Border(
          top: new BorderSide(color: borderSideColor),
          bottom: new BorderSide(color: borderSideColor),
        ),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconTheme.merge(
              data: new IconThemeData(
                  color: _iconColor.evaluate(_easeInAnimation)),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Expanded(
                    child: widget.title,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    child: new InkWell(
                      onTap: _handleTap,
                      child: new RotationTransition(
                        turns: _iconTurns,
                        child: const Icon(Icons.expand_more),
                      ),
                    ),
                  ),
                ],
              )),
          new ClipRect(
            child: new Align(
              heightFactor: _easeInAnimation.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = theme.textTheme.subhead.color
      ..end = theme.accentColor;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _backgroundColor.end = widget.backgroundColor;

    final bool closed = !_isExpanded && _controller.isDismissed;
    return new AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : new Column(children: widget.children),
    );
  }
}

//new ListTile(
//contentPadding: EdgeInsets.symmetric(
//vertical: 0.0,
//horizontal: 0.0,
//),
////              onTap: _handleTap,
//leading: Icon(
//Icons.add_box,
//color: Colors.amber,
//size: 30.0,
//),
//title: new Text(
//'Title With Heading One',
//maxLines: 1,
//textAlign: TextAlign.start,
//style: TextStyle(
//color: Colors.amber,
//fontSize: 20.0,
//fontWeight: FontWeight.normal,
//),
//),
//trailing: widget.trailing ??
//Container(
//width: 80.0,
//height: 80.0,
//child: InkWell(
//onTap: _handleTap,
//child: new RotationTransition(
//turns: _iconTurns,
//child: const Icon(Icons.expand_more),
//),
//),
//),
//),
