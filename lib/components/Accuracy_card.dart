import 'dart:math' as math;
import 'package:anemia_project_app/components/prop_value_text.dart';
import 'package:anemia_project_app/components/prop_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:core';
import '../constants.dart';


class accuracyCard extends StatefulWidget {
  String category;
  String anemia;
  bool isLoaded;


  accuracyCard({ required this.anemia,required this.category,required this.isLoaded, Key? key}) : super(key: key);

  @override
  State<accuracyCard> createState() => _accuracyCardState();
}

class _accuracyCardState extends State<accuracyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 7 * MediaQuery.of(context).size.width / 8,
      margin: const EdgeInsets.only(left: 22, right: 22,top: 15, bottom: 20),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10,left:35,right: 10, bottom: 25),
          child: Stack(
            children:<Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    'Result: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Raleway-Regular',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff45539F),
                        height: 1),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(right: 10, top: 25),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/nn.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Positioned(
                top:100,
                 left: 2,
                child: propValueWidget(
                  widget1:  textProperty(
                    t: widget.isLoaded?'Anemia:':'',
                    c: black,
                  ),
                  widget2: textValue(
                    t: widget.isLoaded?widget.anemia:'',
                    c: widget.anemia=='detected'?Colors.red:black,
                  ),
                ),
              ),
              Positioned(
               top:80,
                left: 2,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 65),
                  child: propValueWidget(
                    widget1:  textProperty(
                      t: widget.isLoaded?'Predicted Class:':'',
                      c: black,
                    ),
                    widget2: textValue(
                      t: widget.isLoaded?widget.category:'',
                      c: black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
