import 'package:flutter/material.dart';
import 'package:moodle_app/Pages/Home/screen.dart';

final homeScreen = Screen(
  title: 'Home',
  buildContext: (BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              title: Text(
                'Notifications',
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black54,
                  wordSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: 15.0,
                right: 5.0,
              ),
              child: Card(
                color: Theme.of(context).cardColor,
                elevation: 3.0,
                child: InkWell(
                  onTap: () => true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        width: 30.0,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            '8',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                          border: Border.all(
                            color: Colors.red,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                        ),
                      ),
                      Text('You have unread messages'),
                      IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.grey,
                        onPressed: () => null,
                        splashColor: Colors.white,
                        highlightColor: Colors.red,
                        padding: EdgeInsets.all(0.0),
                        iconSize: 24.0,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  },
);
