import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Color?>? animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);

    controller!.forward();

    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [TypewriterAnimatedText('Flash Chat',
                  speed: Duration(milliseconds: 200),
                    ),],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(label: 'Log In', onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            }, color: Colors.lightBlueAccent),
            RoundedButton(label: 'Register', onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            }, color: Colors.blueAccent)
          ],
        ),
      ),
    );
  }
}


