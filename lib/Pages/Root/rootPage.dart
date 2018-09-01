import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moodle_app/Pages/Login/loginPage.dart';
import 'package:moodle_app/Pages/Root/style.dart';
import 'package:moodle_app/Components/LoginProcessButton.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  TextEditingController _urlTextFieldController = TextEditingController();
  String _pageHostLink;
  String _errorText;
  GlobalKey<FormState> formKey = GlobalKey();

  Future<bool> _onWillPop() async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: new Text('Are you sure?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Yes'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: null,
        body: ListView(
          children: <Widget>[
            Center(
              child: Container(
                height: 600.0,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 25.0),
                      alignment: Alignment.center,
                      child: rootImage,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      child: Text(
                        'Please type your institute\'s openSIS web address',
                        softWrap: false,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          textBaseline: TextBaseline.alphabetic,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: TextFormField(
                        autofocus: false,
                        autocorrect: false,
                        textAlign: TextAlign.start,
                        controller: _urlTextFieldController,
                        keyboardType: TextInputType.url,
                        validator: (val) => val == null || val.isEmpty
                            ? 'This field cannot be left empty'
                            : null,
//                        onEditingComplete: onPressed,
                        onFieldSubmitted: (val) =>
                            print('field submitted: $val'),
                        onSaved: (val) => _pageHostLink = val,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial',
                          fontSize: 18.0,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1.0,
                                style: BorderStyle.solid),
                          ),
                          contentPadding: EdgeInsets.all(16.0),
                          prefixText: 'http://',
                          hintText: 'demo.opensis.com',
                          errorText: _errorText,
                          errorMaxLines: 1,
                          hintStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontFamily: 'Arial',
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    LoginProgressButton(
                      buttonColor: Theme.of(context).buttonColor,
                      splashColor: Theme.of(context).splashColor,
                      onPressed: onPressed,
                      navigator: _navigation,
                      successButtonColor: Colors.greenAccent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(
              pageHostLink: _pageHostLink,
            ),
      ),
    );
    _resetTextField();
  }

//  void _validateField() {
//    String value = _urlTextFieldController.text;
//    print("value is $value of datatype ${value.runtimeType}");
//    setState(() {
//      _errorText = value == null || value.isEmpty
//          ? 'This field cannot be left empty'
//          : null;
//      _pageHostLink = value;
//    });
//  }

  bool onPressed() {
    print('on press function called');
    var form = formKey.currentState;
    return form.validate();
  }

//  ValidationFunction _validateTextField(String value) {
//    print("value is $value of datatype ${value.runtimeType}");
//    _validateField();
//    return () => valid(value);
//  }

//  bool valid(String value) {
//    return value == null ? false : value.isNotEmpty;
//  }

//  bool validateTextField(String value) {
//    if (value != null) {
//      return value.isEmpty;
//    }
//    return true;
//  }

  void _resetTextField() {
    _urlTextFieldController.clear();
    _errorText = null;
  }

  @override
  void dispose() {
    this._urlTextFieldController.dispose();
    super.dispose();
  }
}
