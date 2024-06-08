import 'package:flutter/material.dart';
// import 'package:share/share.dart';
import '../constants.dart';

class ReusableCard extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  final int views;
  final String gender;

  ReusableCard({
    required this.id,
    required this.title,
    required this.content,
    required this.views,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: lightReddish,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: darkGrey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: heading1(color: offWhite),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text(
            content,
            textAlign: TextAlign.center,
            style: bigText(color: offWhite),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
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
                    views.toString(),
                    style: smallText(color: offWhite),
                  ),
                ],
              ),
              Text(
                gender,
                style: smallText(color: offWhite),
              ),
              // IconButton(
              //   icon: Icon(Icons.share, color: offWhite),
              //   onPressed: () {
              //     final String link = 'https://yourapp.com/card/$id';
              //     Share.share('Check out this card: $link');
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
