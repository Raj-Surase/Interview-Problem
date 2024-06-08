import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200, // Increase the height of the TextField
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null, // Allows multiple lines
                decoration: InputDecoration(
                  filled: true,
                  fillColor: lightReddish,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: darkGrey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: darkGrey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Enter a message',
                  labelStyle: smallText(color: offWhite),
                  floatingLabelBehavior: FloatingLabelBehavior
                      .never, // Remove the label when it floats
                ),
                style: smallText(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Your message has been posted!"),
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
                'Post',
                style: buttonText(color: darkGrey),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(lightGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
