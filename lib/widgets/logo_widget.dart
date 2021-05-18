import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('images/icons/buy_icon.png'),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'But it',
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
