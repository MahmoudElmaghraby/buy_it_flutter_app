import 'package:but_it_flutter_app/provider/model_hud.dart';
import 'package:but_it_flutter_app/screens/home_screen.dart';
import 'package:but_it_flutter_app/services/auth.dart';
import 'package:but_it_flutter_app/widgets/custom_text_field.dart';
import 'package:but_it_flutter_app/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SignUpScreen';
  String _email, _password;
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              LogoWidget(),
              SizedBox(height: height * 0.1),
              CustomTextField(
                hint: 'Enter your name',
                icon: Icons.perm_identity,
                onClick: (value) {},
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                hint: 'Enter your email',
                icon: Icons.email,
                onClick: (value) => _email = value,
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                hint: 'Enter your password',
                icon: Icons.lock,
                onClick: (value) => _password = value,
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
                  onPressed: () async {
                    final modelHud = Provider.of<ModelHud>(
                      context,
                      listen: false,
                    );
                    //modelHud.changeIsLoading(true);
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      try {
                        await _auth.signUp(_email, _password);
                        modelHud.changeIsLoading(false);
                        Navigator.pushReplacementNamed(context, HomeScreen.id);
                      } on PlatformException catch (e) {
                        modelHud.changeIsLoading(false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              e.message,
                            ),
                          ),
                        );
                      }
                    }
                    modelHud.changeIsLoading(false);
                  },
                  child: Text(
                    'SignUp',
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
                    'Do have an account? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Login',
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
      ),
    );
  }
}
