import 'package:flutter/material.dart';
import 'package:interview_problem/Components/custombutton.dart';
import 'package:interview_problem/Components/reusablecontainer.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CircleAvatar(
            radius: screenWidth(context) * 0.15,
            backgroundColor: lightReddish,
            child: Icon(Icons.person, size: 50, color: offWhite),
          ),
          SizedBox(height: 16),
          Text(
            'Username',
            style: heading1(color: darkGrey),
          ),
          Text(
            'Viswakarma Institute of Information Technology',
            style: smallText(color: darkGrey),
          ),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Analytics',
              style: heading1(color: lightReddish),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableContainer(number: "19", label: "Impressions"),
                ReusableContainer(number: "19", label: "Total Posts"),
                ReusableContainer(number: "2903", label: "Likes"),
              ],
            ),
          ),
          SizedBox(height: 24),
          CustomButtonWidget(
            buttons: [
              ButtonData(
                text: 'Terms and Conditions',
                onTap: () {
                  // Handle tap
                },
              ),
              ButtonData(
                text: 'Privacy Policy',
                onTap: () {
                  // Handle tap
                },
              ),
              ButtonData(
                text: 'Data Safety',
                onTap: () {
                  // Handle tap
                },
              ),
              ButtonData(
                text: 'Delete my account',
                onTap: () {
                  // Handle tap
                },
              ),
            ],
          ),
          SizedBox(height: 24),
          SizedBox(
            width: screenWidth(context),
            height: 46,
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("You successfully logged out."),
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
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(lightReddish),
              ),
              child: Text(
                'Logout',
                style: smallText(color: darkGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
