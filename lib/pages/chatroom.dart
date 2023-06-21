import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:random_avatar/random_avatar.dart';

class Chatroom extends StatefulWidget {
  const Chatroom({super.key});

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  bool _isSending = false;

  void sendMessage() {
    setState(() {
      _isSending = true;
    });

    // Simulate sending message delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isSending = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample Name"),
        actions: [
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: RandomAvatar(
              DateTime.now().toIso8601String(),
              height: 50,
              width: 52,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          LinearProgressBar(
            maxSteps: 6,
            progressType:
                LinearProgressBar.progressTypeLinear, // Use Linear progress
            currentStep: 1,
            progressColor: Colors.blue,
            backgroundColor: Colors.grey,
          ),
          Expanded(child: Container()),
          Visibility(
            visible: _isSending,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 50.0,
              curve: Curves.easeInOut,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 16.0),
                  Text(
                    'Sending...',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.pink,
                    ),
                    onPressed: () {
                      sendMessage();
                    },
                  ),
                ),
                onChanged: (text) {
                  // Add code here to handle text input changes
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
