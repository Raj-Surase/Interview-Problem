// lib/home_content_screen.dart
import 'package:flutter/material.dart';
import 'package:interview_problem/constants.dart';

class HomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: lightReddish,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Confession',
                  style: heading1(color: offWhite),
                ),
                SizedBox(height: screenHeight(context) * 0.15),
                Text(
                  'GDSC Lead is looking so cute and handsome',
                  textAlign: TextAlign.center,
                  style: bigText(color: offWhite),
                ),
                SizedBox(height: screenHeight(context) * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: offWhite,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '1000',
                          style: smallText(color: offWhite),
                        ),
                      ],
                    ),
                    Text(
                      'Male',
                      style: smallText(color: offWhite),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text("Comment on this posts."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Okay"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Comment',
              style: buttonText(color: darkGrey),
            ),
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(lightGrey),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt),
              SizedBox(width: 8),
              Text('Follow us on Instagram'),
            ],
          ),
        ],
      ),
    );
  }
}
