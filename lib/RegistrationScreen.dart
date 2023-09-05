import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'components/login_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/user_reg';

  RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 0.04 * MediaQuery.of(context).size.height),
              child: ListView(
                children:<Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:6,bottom: 13),
                        width: 0.85*MediaQuery.of(context).size.width,
                        child: Text(
                          'Register',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Raleway-Regular',
                              color: Colors.black87,
                              fontSize: 30,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 345,
                          height: 335,
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Sign_up.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 26,right: 26, top:28,bottom:8 ),
                            child: TextFormField(
                              controller: TextEditingController(),
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Color(0xFF2B4F70),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            //color: Color(0xFFE6E8EB),
                            margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                            child: TextFormField(
                              controller: TextEditingController(),
                              decoration: const InputDecoration(
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(
                                  color: Color(0xFF2B4F70),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            //color: Color(0xFFE6E8EB),
                            margin: const EdgeInsets.only(left: 26,right: 27, top:8,bottom:40),
                            child: TextFormField(
                              controller: TextEditingController(),
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Color(0xFF2B4F70),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          LoginButton(
                            text: "Register",
                            onPress: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            w:MediaQuery.of(context).size.width-30,
                            color: 0xff6F8EFC,
                            textColor: 0xFFffffff,
                            highlight: 0xff451EB7,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 26,right: 27, top:29,bottom:20),
                        child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Divider(color: Colors.black87,)
                              ),
                              Text("OR"),
                              Expanded(
                                  child: Divider(color: Colors.black87,)
                              ),
                            ]
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 28),
                        child: LoginButton(
                          text: "Login",
                          onPress: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          w:MediaQuery.of(context).size.width-100,
                          color: 0xFFffffff,
                          textColor: 0xFF000000,
                          highlight: 0xffe0dfdc,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

