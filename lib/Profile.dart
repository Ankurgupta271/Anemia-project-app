import 'dart:io';
import 'package:flutter/material.dart';
import 'package:anemia_project_app/components/BottomNavBar.dart';
import 'dart:math' as math;
import 'package:anemia_project_app/Profile.dart';
import 'package:anemia_project_app/components/profile_field_widget.dart';
import '../constants.dart';
import 'package:anemia_project_app/components/login_button.dart';
import 'package:anemia_project_app/Home.dart';
import 'components/prop_value_text.dart';
import 'components/prop_value_widget.dart';


class ProfileScreen extends StatefulWidget {
  static const String id = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<textValue> value = <textValue>[
    textValue(t: 'Rick Sanchez', c: black),
    textValue(t: '+911234567890', c: black),
    textValue(t: 'abc@xyz.com', c: black),
  ];
  final List<textProperty> property = <textProperty>[
    textProperty(t: 'Name :', c: black),
    textProperty(t: 'Mobile No.:', c: black),
    textProperty(t: 'E-mail :', c: black),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, Home.id);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: -146,
                left: -50,
                child: Container(
                    width: 498,
                    height: 358,
                    decoration: BoxDecoration(
                      color: Color(0xff6F8EFC).withOpacity(0.90),
                      borderRadius:
                      BorderRadius.all(Radius.elliptical(498, 358)),
                    ))),
            Positioned(
                top: 36,
                left: 15,
                child: Container(
                    width: 20,
                    height: 30,
                  child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {  },),
                    ),),
            const Positioned(
              left: 155,
              top: 58,
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Positioned(
              left: 100,
              top: 120,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/rick.png"),
                radius: 90,
              ),
            ),
            Positioned(
              top: 280,
              left: 30,
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: double.maxFinite,
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: property.length,
                          itemBuilder: (BuildContext context, int index) {
                            return profileField(
                                w: propValueWidget(
                                  widget1: property[index],
                                  widget2: value[index],
                                ));
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top:34),
                        child: LoginButton(
                          text: "EDIT",
                          onPress: () {
                            //Navigator.pushNamed(context, '/user_reg');
                          },
                          w:MediaQuery.of(context).size.width-130,
                          color: 0xff6F8EFC,
                          textColor: 0xFFffffff,
                          highlight: 0xff451EB7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar:BottomBar(
          index: 2,context: context,
        ),// bottomNavigationBar:
      ),
    );
  }
}
