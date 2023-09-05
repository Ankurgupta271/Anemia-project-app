import 'package:anemia_project_app/components/BottomNavBar.dart';
import 'package:anemia_project_app/components/notification_card.dart';
import 'package:anemia_project_app/Home.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = '/notif';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List colors = [Colors.pinkAccent,Colors.teal,Colors.lightGreenAccent,Colors.yellow,Colors.indigo,Colors.blue,Colors.lightBlueAccent];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, Home.id);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Padding(
                      padding: EdgeInsets.only(top: 18,bottom: 24,left: 10),
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          shadows: [
                            BoxShadow(
                              color: Color(0x7fffffff),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount:7,
                        itemBuilder: (BuildContext context, int index) {
                          return NotificationsCard(
                              time: '10:12 am',
                              details: "A newer version of the app is available for download.", color_: colors[index],);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(
          index: 1, context: context,
        ),
      ),
    );
  }
}
