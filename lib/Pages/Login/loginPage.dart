import 'package:flutter/material.dart';
import 'package:moodle_app/Pages/Root/rootPage.dart';
import 'package:moodle_app/Components/LoginProcessButton.dart';
import 'package:moodle_app/Pages/Login/style.dart';
import 'package:moodle_app/Components/LoginInputField.dart';

class LoginPage extends StatefulWidget {
  @required
  final String pageHostLink;

  const LoginPage({Key key, this.pageHostLink = 'openschool.opensis.com'})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _remember = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: null,
      body: Center(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 500.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                        colors: [Colors.lightBlue, Colors.lightBlueAccent],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 1.0),
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 25.0),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/openschool.jpg',
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      LoginInputField(
                        hintText: 'Enter Username',
                        prefixIcon: user,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      LoginInputField(
                        hintText: 'Enter Password',
                        prefixIcon: lock,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Switch(
                            activeColor: Colors.green,
                            value: _remember,
                            onChanged: (value) => setState(
                                  () {
                                    _remember = value;
                                    _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text(_remember
                                            ? 'You will automatically be signed in next time'
                                            : 'You will be signed out once you close the app'),
                                        duration: Duration(seconds: 1),
                                        backgroundColor: _remember
                                            ? Colors.green
                                            : Theme.of(context)
                                                .primaryColorDark,
                                      ),
                                    );
                                  },
                                ),
                          ),
                          Text(
                            'Remember Me',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      LoginProgressButton(
                        buttonColor: Colors.green,
                        splashColor: Colors.greenAccent,
                        onPressed: null,
                        successButtonColor: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FlatButton(
                        color: Colors.transparent,
                        highlightColor: Theme.of(context).accentColor,
                        splashColor: Colors.transparent,
                        onPressed: () => null,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: 70.0, right: 0.0, left: 0.0, bottom: 0.0),
                  child: Container(
                    height: 50.0,
                    width: 250.0,
                    child: Card(
                      elevation: 2.0,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          widget.pageHostLink,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void loginUser() {}
}
