import 'package:flutter/material.dart';

import 'decorator.dart';

class NotificationsCard extends StatelessWidget {
  final String time;
  final String details;
  final Color color_;
  const NotificationsCard({Key? key, required this.time, required this.details,required this.color_})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Center(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0x3f68706e),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 1),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              container(color_: color_,),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10, top: 25,left:20),
                  child: Column(
                    children: [
                      Container(
                        margin:EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "App Update",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              time,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6,right:35,left: 1),
                        child: Text(
                          "$details",
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
