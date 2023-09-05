import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  final VoidCallback onPress;

  UploadButton({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        margin: EdgeInsets.only(left: 100,right:100,bottom:16),
        elevation: 7,
        child: Container(
          padding: EdgeInsets.only(top:5,bottom: 10),
          height: 155,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.white10,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffFF3030),
                blurRadius: 1,
                offset: Offset(1, 4),
              ),
            ],
             color: Colors.white10.withOpacity(0.04),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 145,
                height: 100,
                child: IconButton(
                  onPressed: onPress,
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    size: 100,
                    color: Color(0xFFffffff),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Upload Image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
