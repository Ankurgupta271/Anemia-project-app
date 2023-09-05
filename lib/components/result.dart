import 'dart:io';
import 'package:anemia_project_app/components/prop_value_text.dart';
import 'package:anemia_project_app/components/prop_value_widget.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../image_model.dart';
import 'ImageListTile.dart';

class summary extends StatefulWidget {
  final String? imagePath;
  final VoidCallback onPress;

  summary(
      {required this.imagePath,
      required this.onPress,
      });

  @override
  State<summary> createState() => _summaryState();
}

class _summaryState extends State<summary> {
  late File file;

  @override
  void initState() {
    super.initState();
    file = File(widget.imagePath!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.only(left:20,right: 30,bottom: 50),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left:40,right: 100, top: 15, bottom: 20),
                  child: Text(
                    "Test \nImage:",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                        height: 1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 20, bottom: 20),
                  width: 80,
                  height: 80,
                  child: Image.file(
                    file,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 22, top: 5,bottom: 10),
            child: Text(
              "XAI Image:",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 1,
                  fontWeight: FontWeight.normal,
                  color: Colors.teal,
                  height: 1),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.file(
                    file,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 50, bottom: 15, right: 15),
                  child: SizedBox(
                    width: 370,
                    height: 1,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                Image_Model(
                    imagePath: widget.imagePath!,
                    caller: "Widget3",
                    text: "Revaluate Result",
                    c: 0xff45539F,
                    onPress: widget.onPress,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
