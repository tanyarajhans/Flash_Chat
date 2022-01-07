import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  

  AnimationController controller;
  Animation animation;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this
    );
    
    animation = CurvedAnimation(
      parent: controller, 
      curve: Curves.decelerate
    );

    controller.forward();
    controller.addListener(() {
      setState(() {
        
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(tag: 'logo', 
                child: Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0,
                  )
                ),
                TypewriterAnimatedTextKit(
                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              Colors.lightBlueAccent, 
              'Log In', 
              () {
            //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              }
            ),
            RoundedButton(
              Colors.blueAccent, 
              'Register', 
              () {
            //Go to login screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              }
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 16.0),
            //   child: Material(
            //     color: Colors.blueAccent,
            //     borderRadius: BorderRadius.circular(30.0),
            //     elevation: 5.0,
            //     child: MaterialButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, RegistrationScreen.id);
            //       },
            //       minWidth: 200.0,
            //       height: 42.0,
            //       child: Text(
            //         'Register',
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton(this.colour, this.title, this.onPressed);

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white
            )
          ),
        ),
      ),
    );
  }
}
