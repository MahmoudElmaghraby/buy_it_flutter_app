import 'package:but_it_flutter_app/constants.dart';
import 'package:but_it_flutter_app/screens/signup_screen.dart';
import 'package:but_it_flutter_app/services/auth.dart';
import 'package:but_it_flutter_app/widgets/custom_text_field.dart';
import 'package:but_it_flutter_app/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'LoginScreen';
  String _email;
  String _password;
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            LogoWidget(),
            SizedBox(height: height * 0.1),
            CustomTextField(
              hint: 'Enter your email',
              icon: Icons.email,
              onClick: (value){
                _email = value;
              },
            ),
            SizedBox(height: height * 0.02),
            CustomTextField(
              hint: 'Enter your password',
              icon: Icons.lock,
              onClick: (value){
                _password = value;
              },
            ),
            SizedBox(height: height * 0.05),
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.black,
                onPressed: () async{
                  if (_globalKey.currentState.validate()) {
                    _globalKey.currentState.save();
                    final _authResult = await _auth.signIn(_email, _password);
                    print(_authResult.user.uid);
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, SignUpScreen.id),
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
