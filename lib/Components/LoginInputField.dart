import 'package:flutter/material.dart';

class LoginInputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;

  const LoginInputField(
      {Key key, this.hintText, this.prefixIcon, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white, width: 2.0, style: BorderStyle.solid)),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.white,
          size: 20.0,
        ),
      ),
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    );
  }
}
