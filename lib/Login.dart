import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'components/login_button.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                      margin: EdgeInsets.only(top:12,bottom: 20),
                      width: 0.85*MediaQuery.of(context).size.width,
                      child: Text(
                        'Login',
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
                            image: AssetImage('assets/images/Login.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //color: Color(0xFFE6E8EB),
                          margin: const EdgeInsets.only(left: 26,right: 26, top: 14,bottom: 20),
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
                        LoginButton(
                          text: "Login",
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
                      margin: const EdgeInsets.only(bottom: 24),
                      child: TextButton(
                        style: TextButton.styleFrom(
                        primary: Colors.black87,
                       elevation: 1.5,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Raleway-Regular',
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 13.0),
                       backgroundColor: Colors.white),
                        onPressed: () {Navigator.pushNamed(context, '/user_reg');},
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

