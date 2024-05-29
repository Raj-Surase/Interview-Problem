import 'package:flutter/material.dart';
import 'package:interview_problem/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final List<ButtonData> buttons;

  const CustomButtonWidget({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightBlue,
      ),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: buttons
              .map((button) => Column(
                    children: [
                      InkWell(
                        onTap: button.onTap,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  button.text,
                                  style: smallText(color: darkGrey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (button != buttons.last)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Divider(
                            color: darkGrey,
                          ),
                        ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ButtonData {
  final String text;
  final VoidCallback onTap;

  ButtonData({
    required this.text,
    required this.onTap,
  });
}
