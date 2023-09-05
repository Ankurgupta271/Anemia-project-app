import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:anemia_project_app/components/login_button.dart';


class OnboardingScreen extends StatelessWidget {
  static const String id = '/onboard';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60),
                  color: Colors.transparent,
                  //height: MediaQuery.of(context).size.height-350,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo1.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 35),
                        margin: EdgeInsets.only(bottom: 25),
                        child: Text(
                          "HemaApp",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black45,
                            fontSize: 30),
                        ),
                      ),
                      LoginButton(
                        text: "Register",
                        onPress: () {
                          Navigator.pushNamed(context, '/user_reg');
                        },
                        w:MediaQuery.of(context).size.width-40,
                        color: 0xff6F8EFC,
                        textColor: 0xFFffffff,
                        highlight: 0xff451EB7,
                      ),
                      LoginButton(
                        text: "Login",
                        onPress: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        w:MediaQuery.of(context).size.width-100,
                        color: 0xFFFED544,
                        textColor: 0xFFffffff,
                        highlight: 0xffE6E8EB,
                      ),
                    ],
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
