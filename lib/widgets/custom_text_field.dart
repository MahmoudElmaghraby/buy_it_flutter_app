import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;

  String _errorMessage() {
    switch (hint) {
      case 'Enter your name':
        return 'Name is empty !';
      case 'Enter your email':
        return 'Email is empty !';
      case 'Enter your password':
        return 'Password is empty !';
      default:
        return '';
    }
  }

  const CustomTextField({
    Key key,
    @required this.hint,
    @required this.icon,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return _errorMessage();
            // ignore: missing_return
          }
        },
        onSaved: onClick,
        keyboardType:
            (hint == 'Enter your email') ? TextInputType.emailAddress : null,
        obscureText: (hint == 'Enter your password'),
        cursorColor: KMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: KMainColor,
          ),
          filled: true,
          fillColor: KSecondaryColor,
          enabledBorder: OutlineInputBorder(
            //Before user clicked
            //Border from every side
            borderSide: BorderSide(
              //to change the border color to white
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            //Before user clicked
            //Border from every side
            borderSide: BorderSide(
              //to change the border color to white
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            //Before user clicked
            //Border from every side
            borderSide: BorderSide(
              //to change the border color to white
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
